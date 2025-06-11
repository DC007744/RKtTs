

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


CREATE SCHEMA IF NOT EXISTS "public";


ALTER SCHEMA "public" OWNER TO "pg_database_owner";


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE OR REPLACE FUNCTION "public"."match_workbook_content"("query_embedding" "extensions"."vector", "match_threshold" double precision, "match_count" integer) RETURNS TABLE("id" "uuid", "section" "text", "content" "text", "embedding" "extensions"."vector", "created_at" timestamp with time zone, "similarity" double precision)
    LANGUAGE "sql" STABLE
    AS $$
  SELECT
    wc.id,
    wc.section,
    wc.content,
    wc.embedding,
    wc.created_at,
    1 - (wc.embedding <=> query_embedding) AS similarity -- Cosine similarity calculation (1 - cosine distance)
  FROM
    public.workbook_content wc
  WHERE 1 - (wc.embedding <=> query_embedding) > match_threshold -- Filter by similarity threshold
  ORDER BY
    wc.embedding <=> query_embedding -- Order by cosine distance (ascending, closest first)
  LIMIT match_count; -- Limit the number of results
$$;


ALTER FUNCTION "public"."match_workbook_content"("query_embedding" "extensions"."vector", "match_threshold" double precision, "match_count" integer) OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."match_workbook_content"("query_embedding" "extensions"."vector", "match_threshold" double precision, "match_count" integer, "filter_by_stage" "text" DEFAULT NULL::"text") RETURNS TABLE("id" "uuid", "section" "text", "content" "text", "stage" "text", "embedding" "extensions"."vector", "created_at" timestamp with time zone, "similarity" double precision)
    LANGUAGE "sql" STABLE
    AS $$
  SELECT
    wc.id,
    wc.section,
    wc.content,
    wc.stage, -- Return the stage column
    wc.embedding,
    wc.created_at,
    1 - (wc.embedding <=> query_embedding) AS similarity
  FROM
    public.workbook_content wc
  WHERE
    1 - (wc.embedding <=> query_embedding) > match_threshold
    AND (filter_by_stage IS NULL OR filter_by_stage = '' OR wc.stage = filter_by_stage) -- Conditional filtering: only apply if filter_by_stage is provided and not empty
  ORDER BY
    wc.embedding <=> query_embedding -- Order by cosine distance (ascending, closest first)
  LIMIT match_count; -- Limit the number of results
$$;


ALTER FUNCTION "public"."match_workbook_content"("query_embedding" "extensions"."vector", "match_threshold" double precision, "match_count" integer, "filter_by_stage" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."save_session_data"("p_chapter_id" "uuid", "p_conversation_summary" "text", "p_messages" "jsonb", "p_reflection_questions_summary" "text", "p_session_id" "uuid") RETURNS "void"
    LANGUAGE "plpgsql"
    AS $$
DECLARE
    msg JSONB;
BEGIN
    -- Update the user_sessions table with new metadata
    UPDATE user_sessions
    SET
        chapter_id = p_chapter_id,
        conversation_summary = p_conversation_summary,
        reflection_questions_summary = p_reflection_questions_summary,
        last_active = NOW() -- Also update last_active timestamp
    WHERE id = p_session_id;
    
    -- Insert messages into conversation_messages table
    IF p_messages IS NOT NULL AND jsonb_array_length(p_messages) > 0 THEN
        FOR msg IN SELECT * FROM jsonb_array_elements(p_messages)
        LOOP
            INSERT INTO conversation_messages (session_id, role, content)
            VALUES (
                p_session_id,
                msg->>'role',
                msg->>'content'
            );
        END LOOP;
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        -- Log the error
        RAISE NOTICE '[save_session_data] Error saving session %: %', p_session_id, SQLERRM;
        -- Re-raise the exception
        RAISE;
END;
$$;


ALTER FUNCTION "public"."save_session_data"("p_chapter_id" "uuid", "p_conversation_summary" "text", "p_messages" "jsonb", "p_reflection_questions_summary" "text", "p_session_id" "uuid") OWNER TO "postgres";


COMMENT ON FUNCTION "public"."save_session_data"("p_chapter_id" "uuid", "p_conversation_summary" "text", "p_messages" "jsonb", "p_reflection_questions_summary" "text", "p_session_id" "uuid") IS 'Saves session data including messages and metadata with proper transaction handling';



CREATE OR REPLACE FUNCTION "public"."update_updated_at_column"() RETURNS "trigger"
    LANGUAGE "plpgsql"
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$;


ALTER FUNCTION "public"."update_updated_at_column"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."additional_prompts" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "chapter_id" "uuid" NOT NULL,
    "text" "text" NOT NULL,
    "follow_up" "text" NOT NULL,
    "order" integer NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "is_active" boolean DEFAULT true
);


ALTER TABLE "public"."additional_prompts" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."conversation_messages" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "session_id" "uuid" NOT NULL,
    "timestamp" timestamp with time zone DEFAULT "now"() NOT NULL,
    "role" "text" NOT NULL,
    "content" "text" NOT NULL,
    CONSTRAINT "conversation_messages_role_check" CHECK (("role" = ANY (ARRAY['user'::"text", 'assistant'::"text"])))
);


ALTER TABLE "public"."conversation_messages" OWNER TO "postgres";


COMMENT ON TABLE "public"."conversation_messages" IS 'Stores individual messages for each conversation session.';



COMMENT ON COLUMN "public"."conversation_messages"."id" IS 'Unique identifier for the message.';



COMMENT ON COLUMN "public"."conversation_messages"."session_id" IS 'References the user session this message belongs to.';



COMMENT ON COLUMN "public"."conversation_messages"."timestamp" IS 'When the message was recorded.';



COMMENT ON COLUMN "public"."conversation_messages"."role" IS 'Who sent the message (''user'' or ''assistant'').';



COMMENT ON COLUMN "public"."conversation_messages"."content" IS 'The text content of the message.';



CREATE TABLE IF NOT EXISTS "public"."health_check" (
    "id" integer NOT NULL,
    "status" "text" DEFAULT 'ok'::"text" NOT NULL,
    "checked_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."health_check" OWNER TO "postgres";


CREATE SEQUENCE IF NOT EXISTS "public"."health_check_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."health_check_id_seq" OWNER TO "postgres";


ALTER SEQUENCE "public"."health_check_id_seq" OWNED BY "public"."health_check"."id";



CREATE TABLE IF NOT EXISTS "public"."instruction_construction_rules" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "template_id" "uuid",
    "components" "jsonb" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."instruction_construction_rules" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."modules" (
    "id" "text" NOT NULL,
    "title" "text" NOT NULL,
    "description" "text" NOT NULL,
    "display_order" integer NOT NULL,
    "stage" "text" NOT NULL
);


ALTER TABLE "public"."modules" OWNER TO "postgres";


COMMENT ON TABLE "public"."modules" IS 'Stores definitions for the therapeutic modules displayed on the dashboard.';



COMMENT ON COLUMN "public"."modules"."id" IS 'Unique identifier (e.g., ''early_life''). Should align with moduleId in user_sessions.modules.';



COMMENT ON COLUMN "public"."modules"."title" IS 'Display title for the module.';



COMMENT ON COLUMN "public"."modules"."description" IS 'Short description shown on the dashboard card.';



COMMENT ON COLUMN "public"."modules"."display_order" IS 'Number for sorting modules chronologically on the dashboard.';



COMMENT ON COLUMN "public"."modules"."stage" IS 'The life stage this module belongs to (e.g., ''The Basics'', ''The Game'').';



CREATE TABLE IF NOT EXISTS "public"."openai_settings" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "temperature" double precision DEFAULT 0.2 NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."openai_settings" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."prompt_template_parameters" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "template_id" "uuid" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "required" boolean DEFAULT true NOT NULL,
    "position" integer NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."prompt_template_parameters" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."prompt_templates" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "key" "text" NOT NULL,
    "name" "text" NOT NULL,
    "description" "text",
    "content" "text" NOT NULL,
    "is_function" boolean DEFAULT false NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."prompt_templates" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."reflection_questions" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "chapter_id" "uuid" NOT NULL,
    "text" "text" NOT NULL,
    "order" integer NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "is_active" boolean DEFAULT true
);


ALTER TABLE "public"."reflection_questions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."section_prompts" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "section_id" "uuid" NOT NULL,
    "category" "text",
    "text" "text" NOT NULL,
    "follow_up" "text",
    "order" integer NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "is_active" boolean DEFAULT true
);


ALTER TABLE "public"."section_prompts" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."session_summaries" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "session_id" "uuid" NOT NULL,
    "summary" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "updated_at" timestamp with time zone
);


ALTER TABLE "public"."session_summaries" OWNER TO "postgres";


COMMENT ON TABLE "public"."session_summaries" IS 'Stores AI-generated summaries of conversation sessions';



CREATE TABLE IF NOT EXISTS "public"."user_sessions" (
    "id" "uuid" NOT NULL,
    "name" "text",
    "age" integer,
    "motivation" "text",
    "onboarding_complete" boolean DEFAULT false NOT NULL,
    "last_active" timestamp with time zone DEFAULT "now"() NOT NULL,
    "modules" "jsonb",
    "current_chapter_id" "uuid",
    "current_section_id" "uuid",
    "current_prompt_id" "uuid",
    "completed_prompts" "uuid"[] DEFAULT '{}'::"uuid"[],
    "season_progress" "jsonb" DEFAULT '{"season1_complete": false, "season2_complete": false, "season3_complete": false, "season4_complete": false}'::"jsonb",
    "onboarding_step_index" integer,
    "chapter_id" "uuid",
    "reflection_questions_summary" "text",
    "conversation_summary" "text",
    "current_module_id" "text",
    "current_module_slug" "text"
);


ALTER TABLE "public"."user_sessions" OWNER TO "postgres";


COMMENT ON TABLE "public"."user_sessions" IS 'User sessions with synchronized current_chapter_id, current_module_id, and current_prompt_id';



COMMENT ON COLUMN "public"."user_sessions"."id" IS 'Client-generated unique session identifier (from localStorage).';



COMMENT ON COLUMN "public"."user_sessions"."name" IS 'User''s provided first name.';



COMMENT ON COLUMN "public"."user_sessions"."age" IS 'User''s provided age (optional).';



COMMENT ON COLUMN "public"."user_sessions"."motivation" IS 'User''s stated motivation for using the app.';



COMMENT ON COLUMN "public"."user_sessions"."onboarding_complete" IS 'Flag indicating if the user has completed the onboarding flow.';



COMMENT ON COLUMN "public"."user_sessions"."last_active" IS 'Timestamp of the last user activity.';



COMMENT ON COLUMN "public"."user_sessions"."modules" IS 'JSONB array storing progress for each module (ModuleProgress[]).';



COMMENT ON COLUMN "public"."user_sessions"."current_module_id" IS 'Stores the current module ID for chapter navigation';



COMMENT ON COLUMN "public"."user_sessions"."current_module_slug" IS 'Stores the current module slug for chapter navigation';



CREATE TABLE IF NOT EXISTS "public"."workbook_chapters" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "number" integer NOT NULL,
    "title" "text" NOT NULL,
    "theme" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "is_active" boolean DEFAULT true,
    "order" integer NOT NULL,
    "slug" "text"
);


ALTER TABLE "public"."workbook_chapters" OWNER TO "postgres";


COMMENT ON COLUMN "public"."workbook_chapters"."slug" IS 'Unique slug identifier for chapter navigation';



CREATE TABLE IF NOT EXISTS "public"."workbook_content" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "section" "text" NOT NULL,
    "content" "text" NOT NULL,
    "embedding" "extensions"."vector"(1536) NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "stage" "text"
);


ALTER TABLE "public"."workbook_content" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."workbook_sections" (
    "id" "uuid" DEFAULT "extensions"."uuid_generate_v4"() NOT NULL,
    "title" "text" NOT NULL,
    "type" "text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "is_active" boolean DEFAULT true,
    "order" integer NOT NULL,
    CONSTRAINT "workbook_sections_type_check" CHECK (("type" = ANY (ARRAY['personal_care_plan'::"text", 'four_seasons_reflection'::"text", 'final_reflection'::"text"])))
);


ALTER TABLE "public"."workbook_sections" OWNER TO "postgres";


ALTER TABLE ONLY "public"."health_check" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."health_check_id_seq"'::"regclass");



ALTER TABLE ONLY "public"."additional_prompts"
    ADD CONSTRAINT "additional_prompts_chapter_id_order_key" UNIQUE ("chapter_id", "order");



ALTER TABLE ONLY "public"."additional_prompts"
    ADD CONSTRAINT "additional_prompts_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."conversation_messages"
    ADD CONSTRAINT "conversation_messages_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."health_check"
    ADD CONSTRAINT "health_check_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."instruction_construction_rules"
    ADD CONSTRAINT "instruction_construction_rules_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."modules"
    ADD CONSTRAINT "modules_display_order_key" UNIQUE ("display_order");



ALTER TABLE ONLY "public"."modules"
    ADD CONSTRAINT "modules_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."openai_settings"
    ADD CONSTRAINT "openai_settings_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."prompt_template_parameters"
    ADD CONSTRAINT "prompt_template_parameters_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."prompt_template_parameters"
    ADD CONSTRAINT "prompt_template_parameters_template_id_name_key" UNIQUE ("template_id", "name");



ALTER TABLE ONLY "public"."prompt_templates"
    ADD CONSTRAINT "prompt_templates_key_key" UNIQUE ("key");



ALTER TABLE ONLY "public"."prompt_templates"
    ADD CONSTRAINT "prompt_templates_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."reflection_questions"
    ADD CONSTRAINT "reflection_questions_chapter_id_order_key" UNIQUE ("chapter_id", "order");



ALTER TABLE ONLY "public"."reflection_questions"
    ADD CONSTRAINT "reflection_questions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."section_prompts"
    ADD CONSTRAINT "section_prompts_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."section_prompts"
    ADD CONSTRAINT "section_prompts_section_id_order_key" UNIQUE ("section_id", "order");



ALTER TABLE ONLY "public"."session_summaries"
    ADD CONSTRAINT "session_summaries_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."session_summaries"
    ADD CONSTRAINT "session_summaries_session_id_key" UNIQUE ("session_id");



ALTER TABLE ONLY "public"."user_sessions"
    ADD CONSTRAINT "user_sessions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."workbook_chapters"
    ADD CONSTRAINT "workbook_chapters_number_key" UNIQUE ("number");



ALTER TABLE ONLY "public"."workbook_chapters"
    ADD CONSTRAINT "workbook_chapters_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."workbook_chapters"
    ADD CONSTRAINT "workbook_chapters_slug_unique" UNIQUE ("slug");



ALTER TABLE ONLY "public"."workbook_content"
    ADD CONSTRAINT "workbook_content_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."workbook_sections"
    ADD CONSTRAINT "workbook_sections_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."workbook_sections"
    ADD CONSTRAINT "workbook_sections_type_key" UNIQUE ("type");



CREATE INDEX "idx_additional_prompts_chapter_id" ON "public"."additional_prompts" USING "btree" ("chapter_id");



CREATE INDEX "idx_conversation_messages_session_id_timestamp" ON "public"."conversation_messages" USING "btree" ("session_id", "timestamp");



CREATE INDEX "idx_reflection_questions_chapter_id" ON "public"."reflection_questions" USING "btree" ("chapter_id");



CREATE INDEX "idx_section_prompts_section_id" ON "public"."section_prompts" USING "btree" ("section_id");



CREATE INDEX "idx_user_sessions_current_chapter_id" ON "public"."user_sessions" USING "btree" ("current_chapter_id");



CREATE INDEX "idx_user_sessions_current_module_id" ON "public"."user_sessions" USING "btree" ("current_module_id");



CREATE INDEX "idx_user_sessions_current_module_slug" ON "public"."user_sessions" USING "btree" ("current_module_slug");



CREATE INDEX "idx_user_sessions_current_section_id" ON "public"."user_sessions" USING "btree" ("current_section_id");



CREATE INDEX "idx_workbook_chapters_slug" ON "public"."workbook_chapters" USING "btree" ("slug");



CREATE INDEX "workbook_content_embedding_idx" ON "public"."workbook_content" USING "ivfflat" ("embedding" "extensions"."vector_cosine_ops") WITH ("lists"='100');



CREATE INDEX "workbook_content_section_idx" ON "public"."workbook_content" USING "btree" ("section");



CREATE INDEX "workbook_content_stage_idx" ON "public"."workbook_content" USING "btree" ("stage");



CREATE OR REPLACE TRIGGER "set_updated_at_instruction_construction_rules" BEFORE UPDATE ON "public"."instruction_construction_rules" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



CREATE OR REPLACE TRIGGER "set_updated_at_prompt_template_parameters" BEFORE UPDATE ON "public"."prompt_template_parameters" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



CREATE OR REPLACE TRIGGER "set_updated_at_prompt_templates" BEFORE UPDATE ON "public"."prompt_templates" FOR EACH ROW EXECUTE FUNCTION "public"."update_updated_at_column"();



ALTER TABLE ONLY "public"."additional_prompts"
    ADD CONSTRAINT "additional_prompts_chapter_id_fkey" FOREIGN KEY ("chapter_id") REFERENCES "public"."workbook_chapters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."conversation_messages"
    ADD CONSTRAINT "conversation_messages_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "public"."user_sessions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."instruction_construction_rules"
    ADD CONSTRAINT "instruction_construction_rules_template_id_fkey" FOREIGN KEY ("template_id") REFERENCES "public"."prompt_templates"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."prompt_template_parameters"
    ADD CONSTRAINT "prompt_template_parameters_template_id_fkey" FOREIGN KEY ("template_id") REFERENCES "public"."prompt_templates"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."reflection_questions"
    ADD CONSTRAINT "reflection_questions_chapter_id_fkey" FOREIGN KEY ("chapter_id") REFERENCES "public"."workbook_chapters"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."section_prompts"
    ADD CONSTRAINT "section_prompts_section_id_fkey" FOREIGN KEY ("section_id") REFERENCES "public"."workbook_sections"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."session_summaries"
    ADD CONSTRAINT "session_summaries_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "public"."user_sessions"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."user_sessions"
    ADD CONSTRAINT "user_sessions_current_chapter_id_fkey" FOREIGN KEY ("current_chapter_id") REFERENCES "public"."workbook_chapters"("id");



ALTER TABLE ONLY "public"."user_sessions"
    ADD CONSTRAINT "user_sessions_current_section_id_fkey" FOREIGN KEY ("current_section_id") REFERENCES "public"."workbook_sections"("id");



CREATE POLICY "Allow anon role to insert new sessions" ON "public"."user_sessions" FOR INSERT TO "anon" WITH CHECK (true);



COMMENT ON POLICY "Allow anon role to insert new sessions" ON "public"."user_sessions" IS 'Allows the anon role to create new user sessions during initial session creation. This is required for the application to function when using the anon key.';



CREATE POLICY "Allow anon role to select their own session" ON "public"."user_sessions" FOR SELECT TO "anon" USING (true);



CREATE POLICY "Allow anon role to update their own session" ON "public"."user_sessions" FOR UPDATE TO "anon" USING (true);



CREATE POLICY "Allow anon users to read" ON "public"."conversation_messages" FOR SELECT TO "anon" USING (true);



CREATE POLICY "Allow anonymous read access to session_summaries" ON "public"."session_summaries" FOR SELECT USING (true);



CREATE POLICY "Allow authenticated users read/update access" ON "public"."user_sessions" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Allow authenticated users to read" ON "public"."conversation_messages" FOR SELECT TO "authenticated" USING (true);



CREATE POLICY "Allow full access to authenticated users for instruction_constr" ON "public"."instruction_construction_rules" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Allow full access to authenticated users for openai_settings" ON "public"."openai_settings" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Allow full access to authenticated users for prompt_template_pa" ON "public"."prompt_template_parameters" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Allow full access to authenticated users for prompt_templates" ON "public"."prompt_templates" TO "authenticated" USING (true) WITH CHECK (true);



CREATE POLICY "Allow read access to anonymous users for instruction_constructi" ON "public"."instruction_construction_rules" FOR SELECT TO "anon" USING (true);



CREATE POLICY "Allow read access to anonymous users for openai_settings" ON "public"."openai_settings" FOR SELECT TO "anon" USING (true);



CREATE POLICY "Allow read access to anonymous users for prompt_template_parame" ON "public"."prompt_template_parameters" FOR SELECT TO "anon" USING (true);



CREATE POLICY "Allow read access to anonymous users for prompt_templates" ON "public"."prompt_templates" FOR SELECT TO "anon" USING (true);



CREATE POLICY "Allow service role to insert/update session_summaries" ON "public"."session_summaries" FOR INSERT TO "service_role" WITH CHECK (true);



CREATE POLICY "Allow service role to update session_summaries" ON "public"."session_summaries" FOR UPDATE TO "service_role" USING (true);



CREATE POLICY "Allow service_role full access" ON "public"."conversation_messages" TO "service_role" USING (true);



CREATE POLICY "Allow service_role full access" ON "public"."user_sessions" TO "service_role" USING (true);



ALTER TABLE "public"."conversation_messages" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."instruction_construction_rules" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."openai_settings" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."prompt_template_parameters" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."prompt_templates" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."session_summaries" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."user_sessions" ENABLE ROW LEVEL SECURITY;


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";



GRANT ALL ON FUNCTION "public"."match_workbook_content"("query_embedding" "extensions"."vector", "match_threshold" double precision, "match_count" integer) TO "anon";
GRANT ALL ON FUNCTION "public"."match_workbook_content"("query_embedding" "extensions"."vector", "match_threshold" double precision, "match_count" integer) TO "authenticated";
GRANT ALL ON FUNCTION "public"."match_workbook_content"("query_embedding" "extensions"."vector", "match_threshold" double precision, "match_count" integer) TO "service_role";



GRANT ALL ON FUNCTION "public"."match_workbook_content"("query_embedding" "extensions"."vector", "match_threshold" double precision, "match_count" integer, "filter_by_stage" "text") TO "anon";
GRANT ALL ON FUNCTION "public"."match_workbook_content"("query_embedding" "extensions"."vector", "match_threshold" double precision, "match_count" integer, "filter_by_stage" "text") TO "authenticated";
GRANT ALL ON FUNCTION "public"."match_workbook_content"("query_embedding" "extensions"."vector", "match_threshold" double precision, "match_count" integer, "filter_by_stage" "text") TO "service_role";



GRANT ALL ON FUNCTION "public"."save_session_data"("p_chapter_id" "uuid", "p_conversation_summary" "text", "p_messages" "jsonb", "p_reflection_questions_summary" "text", "p_session_id" "uuid") TO "anon";
GRANT ALL ON FUNCTION "public"."save_session_data"("p_chapter_id" "uuid", "p_conversation_summary" "text", "p_messages" "jsonb", "p_reflection_questions_summary" "text", "p_session_id" "uuid") TO "authenticated";
GRANT ALL ON FUNCTION "public"."save_session_data"("p_chapter_id" "uuid", "p_conversation_summary" "text", "p_messages" "jsonb", "p_reflection_questions_summary" "text", "p_session_id" "uuid") TO "service_role";



GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "anon";
GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "authenticated";
GRANT ALL ON FUNCTION "public"."update_updated_at_column"() TO "service_role";



GRANT ALL ON TABLE "public"."additional_prompts" TO "anon";
GRANT ALL ON TABLE "public"."additional_prompts" TO "authenticated";
GRANT ALL ON TABLE "public"."additional_prompts" TO "service_role";



GRANT ALL ON TABLE "public"."conversation_messages" TO "anon";
GRANT ALL ON TABLE "public"."conversation_messages" TO "authenticated";
GRANT ALL ON TABLE "public"."conversation_messages" TO "service_role";



GRANT ALL ON TABLE "public"."health_check" TO "anon";
GRANT ALL ON TABLE "public"."health_check" TO "authenticated";
GRANT ALL ON TABLE "public"."health_check" TO "service_role";



GRANT ALL ON SEQUENCE "public"."health_check_id_seq" TO "anon";
GRANT ALL ON SEQUENCE "public"."health_check_id_seq" TO "authenticated";
GRANT ALL ON SEQUENCE "public"."health_check_id_seq" TO "service_role";



GRANT ALL ON TABLE "public"."instruction_construction_rules" TO "anon";
GRANT ALL ON TABLE "public"."instruction_construction_rules" TO "authenticated";
GRANT ALL ON TABLE "public"."instruction_construction_rules" TO "service_role";



GRANT ALL ON TABLE "public"."modules" TO "anon";
GRANT ALL ON TABLE "public"."modules" TO "authenticated";
GRANT ALL ON TABLE "public"."modules" TO "service_role";



GRANT ALL ON TABLE "public"."openai_settings" TO "anon";
GRANT ALL ON TABLE "public"."openai_settings" TO "authenticated";
GRANT ALL ON TABLE "public"."openai_settings" TO "service_role";



GRANT ALL ON TABLE "public"."prompt_template_parameters" TO "anon";
GRANT ALL ON TABLE "public"."prompt_template_parameters" TO "authenticated";
GRANT ALL ON TABLE "public"."prompt_template_parameters" TO "service_role";



GRANT ALL ON TABLE "public"."prompt_templates" TO "anon";
GRANT ALL ON TABLE "public"."prompt_templates" TO "authenticated";
GRANT ALL ON TABLE "public"."prompt_templates" TO "service_role";



GRANT ALL ON TABLE "public"."reflection_questions" TO "anon";
GRANT ALL ON TABLE "public"."reflection_questions" TO "authenticated";
GRANT ALL ON TABLE "public"."reflection_questions" TO "service_role";



GRANT ALL ON TABLE "public"."section_prompts" TO "anon";
GRANT ALL ON TABLE "public"."section_prompts" TO "authenticated";
GRANT ALL ON TABLE "public"."section_prompts" TO "service_role";



GRANT ALL ON TABLE "public"."session_summaries" TO "anon";
GRANT ALL ON TABLE "public"."session_summaries" TO "authenticated";
GRANT ALL ON TABLE "public"."session_summaries" TO "service_role";



GRANT ALL ON TABLE "public"."user_sessions" TO "anon";
GRANT ALL ON TABLE "public"."user_sessions" TO "authenticated";
GRANT ALL ON TABLE "public"."user_sessions" TO "service_role";



GRANT ALL ON TABLE "public"."workbook_chapters" TO "anon";
GRANT ALL ON TABLE "public"."workbook_chapters" TO "authenticated";
GRANT ALL ON TABLE "public"."workbook_chapters" TO "service_role";



GRANT ALL ON TABLE "public"."workbook_content" TO "anon";
GRANT ALL ON TABLE "public"."workbook_content" TO "authenticated";
GRANT ALL ON TABLE "public"."workbook_content" TO "service_role";



GRANT ALL ON TABLE "public"."workbook_sections" TO "anon";
GRANT ALL ON TABLE "public"."workbook_sections" TO "authenticated";
GRANT ALL ON TABLE "public"."workbook_sections" TO "service_role";



ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS  TO "service_role";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES  TO "service_role";






RESET ALL;
