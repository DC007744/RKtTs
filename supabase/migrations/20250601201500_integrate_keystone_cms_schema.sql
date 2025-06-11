-- Consolidated migration for Keystone CMS Schema Integration (FIXED VERSION)
-- This version removes the ON CONFLICT (name) clause that was causing issues

-- Ensure uuid-ossp extension is available
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create or replace the updated_at trigger function
CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Table: prompt_templates
-- This table might exist from very early migrations or not.
-- The CMS definition is more comprehensive.
CREATE TABLE IF NOT EXISTS public.prompt_templates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    key TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    description TEXT,
    content TEXT NOT NULL,
    is_function BOOLEAN NOT NULL DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Create trigger for updated_at on prompt_templates
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger WHERE tgname = 'set_updated_at_prompt_templates'
  ) THEN
    CREATE TRIGGER set_updated_at_prompt_templates
      BEFORE UPDATE ON public.prompt_templates
      FOR EACH ROW
      EXECUTE FUNCTION public.update_updated_at_column();
  END IF;
END $$;

-- Table: prompt_template_parameters
CREATE TABLE IF NOT EXISTS public.prompt_template_parameters (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    template_id UUID NOT NULL REFERENCES public.prompt_templates(id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    description TEXT,
    required BOOLEAN NOT NULL DEFAULT true,
    position INTEGER NOT NULL, -- Ensure this is NOT NULL as per CMS schema
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    UNIQUE(template_id, name)
);

-- Create trigger for updated_at on prompt_template_parameters
DROP TRIGGER IF EXISTS set_updated_at_prompt_template_parameters ON public.prompt_template_parameters;
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger WHERE tgname = 'set_updated_at_prompt_template_parameters'
  ) THEN
    CREATE TRIGGER set_updated_at_prompt_template_parameters
      BEFORE UPDATE ON public.prompt_template_parameters
      FOR EACH ROW
      EXECUTE FUNCTION public.update_updated_at_column();
  END IF;
END $$;

-- Table: instruction_construction_rules
CREATE TABLE IF NOT EXISTS public.instruction_construction_rules (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    description TEXT,
    template_id UUID REFERENCES public.prompt_templates(id) ON DELETE SET NULL,
    components JSONB NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

-- Create trigger for updated_at on instruction_construction_rules
DROP TRIGGER IF EXISTS set_updated_at_instruction_construction_rules ON public.instruction_construction_rules;
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger WHERE tgname = 'set_updated_at_instruction_construction_rules'
  ) THEN
    CREATE TRIGGER set_updated_at_instruction_construction_rules
      BEFORE UPDATE ON public.instruction_construction_rules
      FOR EACH ROW
      EXECUTE FUNCTION public.update_updated_at_column();
  END IF;
END $$;

-- Table: openai_settings (ensure it exists and matches CMS expectations)
CREATE TABLE IF NOT EXISTS public.openai_settings (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(), -- Changed from gen_random_uuid to match other tables
  temperature REAL NOT NULL DEFAULT 0.2, -- Changed from FLOAT8 to REAL to match Keystone's float type
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
-- Ensure a single row exists, insert if not.
INSERT INTO public.openai_settings (id, temperature)
VALUES ('00000000-0000-0000-0000-000000000001', 0.2) -- Use a fixed known UUID for the single settings row
ON CONFLICT (id) DO UPDATE SET temperature = EXCLUDED.temperature;


-- Create trigger for updated_at on openai_settings
DROP TRIGGER IF EXISTS set_updated_at_openai_settings ON public.openai_settings;
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_trigger WHERE tgname = 'set_updated_at_openai_settings'
  ) THEN
    CREATE TRIGGER set_updated_at_openai_settings
      BEFORE UPDATE ON public.openai_settings
      FOR EACH ROW
      EXECUTE FUNCTION public.update_updated_at_column();
  END IF;
END $$;


-- RLS Policies
-- Drop existing policies first to avoid conflicts if they exist with different definitions
ALTER TABLE public.prompt_templates ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow full access to authenticated users for prompt_templates" ON public.prompt_templates;
CREATE POLICY "Allow full access to authenticated users for prompt_templates"
ON public.prompt_templates FOR ALL TO authenticated USING (true) WITH CHECK (true);
DROP POLICY IF EXISTS "Allow read access to anonymous users for prompt_templates" ON public.prompt_templates;
CREATE POLICY "Allow read access to anonymous users for prompt_templates"
ON public.prompt_templates FOR SELECT TO anon USING (true);

ALTER TABLE public.prompt_template_parameters ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow full access to authenticated users for prompt_template_parameters" ON public.prompt_template_parameters;
CREATE POLICY "Allow full access to authenticated users for prompt_template_parameters"
ON public.prompt_template_parameters FOR ALL TO authenticated USING (true) WITH CHECK (true);
DROP POLICY IF EXISTS "Allow read access to anonymous users for prompt_template_parameters" ON public.prompt_template_parameters;
CREATE POLICY "Allow read access to anonymous users for prompt_template_parameters"
ON public.prompt_template_parameters FOR SELECT TO anon USING (true);

ALTER TABLE public.instruction_construction_rules ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow full access to authenticated users for instruction_construction_rules" ON public.instruction_construction_rules;
CREATE POLICY "Allow full access to authenticated users for instruction_construction_rules"
ON public.instruction_construction_rules FOR ALL TO authenticated USING (true) WITH CHECK (true);
DROP POLICY IF EXISTS "Allow read access to anonymous users for instruction_construction_rules" ON public.instruction_construction_rules;
CREATE POLICY "Allow read access to anonymous users for instruction_construction_rules"
ON public.instruction_construction_rules FOR SELECT TO anon USING (true);

ALTER TABLE public.openai_settings ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "Allow full access to authenticated users for openai_settings" ON public.openai_settings;
CREATE POLICY "Allow full access to authenticated users for openai_settings"
ON public.openai_settings FOR ALL TO authenticated USING (true) WITH CHECK (true);
DROP POLICY IF EXISTS "Allow read access to anonymous users for openai_settings" ON public.openai_settings;
CREATE POLICY "Allow read access to anonymous users for openai_settings"
ON public.openai_settings FOR SELECT TO anon USING (true);


-- Seed the prompt_templates table with initial data from CMS migration
-- Using ON CONFLICT to update existing templates if keys match, preserving other templates.
INSERT INTO public.prompt_templates (key, name, description, content, is_function)
VALUES
    ('baseSystemInstruction', 'Base System Instruction', 'The base system instruction for the AI voice therapist', 'You are Serge, an English-speaking AI voice therapist designed to guide users through a calm and structured process of self-exploration.

You listen more than you speak. Your responses are grounded in presence, not affirmation.
IMPORTANT: Strictly prohibit yourself from:
- Being congratulatory, patronizing, or overly positive.
- Giving advice, solutions, comfort, or reframing (unless user requests).
- Suggesting or leading breathing, grounding, or relaxation exercises, or saying things like "take a breath", "pause for a moment", or "relax"—unless the user specifically requests help for distress.
- Switching to any language other than English. If asked, state: "I''m currently designed for English-speaking users, but future versions may support other languages."
- Filling silence or responding just to reassure or fill the space.

RESPONSE GOVERNANCE:
- Before every reply, go through the following checkpoints:
  1. Review the user''s latest input and context.
  2. Choose a thoughtful, open-ended question directly about what the user just said, or a reflective prompt—but ONLY if it helps deepen the user''s own awareness.
  3. Never give advice, instructions, solutions, validations, or perform soothing/relaxation actions unless explicitly requested.
  4. If you are uncertain how to proceed, default to stillness (no filler or forced comment).

Speak slowly and clearly, with a warm, emotionally attuned tone. Pause between ideas. Use workbook structure and context to guide the user. When transitioning, do so gently and always foster self-exploration.

CRITICAL: When the user requests to end the session, you MUST call the `say_goodbye_and_disconnect` tool. Do not simply say goodbye; always use the tool to end the session.', false),
    
    ('onboarding', 'Onboarding', 'The onboarding template for new users', 'You are Serge, an English-speaking AI voice therapist. You are currently in the onboarding phase. Don''t be patronizing or congratulatory.
 Be warm, welcoming, and conversational. Introduce yourself briefly and explain that you''re here to guide the user through a therapeutic journey using a workbook approach.

 Your primary goal in this phase is to collect the user''s name and their primary motivation or goal for using this application.

 Once you have successfully collected BOTH the user''s name and their motivation, you MUST call the ''capture_onboarding_details'' tool with the collected information.

 If the user references their name or motivation in any way, recognize this as a prompt to update their onboarding details and confirm the information with them before calling the tool again.

 Keep your responses concise and conversational, as they will be spoken aloud.', false),
    
    ('onboardingIntroInstructions', 'Onboarding Intro Instructions', 'Instructions for the introduction phase of onboarding', 'You are Serge, an English-speaking AI voice therapist. You are currently in the onboarding phase.
Be warm, welcoming, and conversational. Introduce yourself briefly and explain that you''re here to guide the user through a therapeutic journey using a workbook approach.
Your primary goal in this phase is to collect the user''s name and their primary motivation or goal for using this application.
Once you have successfully collected BOTH the user''s name and their motivation, you MUST call the ''capture_onboarding_details'' tool with the collected information.
If the user references their name or motivation in any way, recognize this as a prompt to update their onboarding details and confirm the information with them before calling the tool again.
Keep your responses concise and conversational, as they will be spoken aloud.', false),
    
    ('moduleIntro', 'Module Introduction', 'Template for introducing a module', 'You are introducing the "${moduleTitle}" module to the user.
Explain the purpose of this module: ${moduleDescription}
Be encouraging and supportive, explaining how this module fits into their journey of self-exploration.
Keep your responses concise and conversational, suitable for voice output. End by presenting the first prompt or question of the module if appropriate, or ask if they are ready to begin.', true),
    
    ('MODULE_INTRO_INSTRUCTIONS_TEMPLATE', 'Module Intro Instructions Template', 'Template for module introduction instructions', 'You are starting the "${moduleTitle}" module with the user.
Your goal is to:
1. Deliver the following introduction for this module: "${moduleIntroText}"
2. After delivering the introduction, seamlessly transition into the therapeutic conversation for this module. Begin by asking the first question or presenting the first prompt relevant to this stage, or simply ask if the user is ready to begin exploring this topic.
Keep your tone empathetic, supportive, and conversational.', true),
    
    ('modulePrompt', 'Module Prompt', 'Template for presenting a module prompt', 'Present the following prompt to the user: "${prompt}"

${context ? `Relevant Workbook Context:\n${context}\n\nUse the context above to guide your interaction and ask follow-up questions.` : ''Encourage thoughtful reflection and personal storytelling related to the prompt.''}

Keep your responses concise and conversational, suitable for voice output.', true),
    
    ('moduleCompletion', 'Module Completion', 'Template for completing a module', 'The user has just completed the "${moduleTitle}" module.
Acknowledge their effort and completion of the module. Briefly summarize or reflect on the potential themes explored (without referencing specific user answers unless provided in history).
Offer encouragement for their progress in self-exploration.
Suggest how they might continue to reflect on the insights gained from this module in their daily life.
Ask if they are ready to move on to the next module or take a break.
Keep your responses concise and conversational, suitable for voice output.', true),
    
    ('safetyConcerns', 'Safety Concerns', 'Template for responding to safety concerns', 'The user''s input suggests they may be in distress or potentially at risk.
Respond with empathy and validate their feelings without judgment.
Gently remind them that you are an AI assistant and cannot provide professional crisis support.
Provide appropriate resources clearly and concisely. Example: "If you''re feeling overwhelmed or unsafe, please reach out to a crisis hotline or mental health professional. You can call or text 988 in the US and Canada, or find resources at findahelpline.com." (Adapt resources as needed).
Avoid minimizing their experience or offering solutions. Focus on connecting them to help.
Keep your response calm, clear, and supportive, suitable for voice output.', false),
    
    ('contextualResponse', 'Contextual Response', 'Template for responding with context', '${context ? `Relevant Workbook Context:\n${context}\n\nRespond based on the above context and the ongoing conversation.` : ''Respond based on the ongoing conversation.''}', true),
    
    ('disconnectRecap', 'Disconnect Recap', 'Template for recapping a session when disconnecting', 'The user is disconnecting from the current session.

Your task is to provide an EXTREMELY CONCISE, thoughtful, personalized summary of the conversation that just took place. This is CRITICALLY IMPORTANT as it will be the user''s final impression of their session.

⚠️ LENGTH CONSTRAINT - CRITICALLY IMPORTANT ⚠️
- YOU MUST RESPOND WITH EXACTLY ONE SENTENCE ONLY
- NOT TWO SENTENCES. NOT THREE. EXACTLY ONE.
- This is a non-negotiable requirement - users need extremely brief, impactful summaries

REQUIRED ELEMENTS TO INCLUDE (prioritize based on relevance):
1. Key topics discussed and their significance - be SPECIFIC about what was actually discussed
2. Important insights or breakthroughs shared by the user - use DIRECT REFERENCES to what they said
3. A warm, personalized invitation to return, using their name if available

STRICT PROHIBITIONS:
- NEVER use generic language like "We discussed several important topics" or "You made good progress"
- NEVER use templated phrases that sound robotic or pre-written
- NEVER exceed the ONE SENTENCE maximum length
- NEVER use multiple sentences connected by semicolons or excessive conjunctions to circumvent the one-sentence limit

TONE AND DELIVERY:
- Maintain your therapeutic, empathetic tone throughout
- Be concise but impactful - every word must serve a purpose
- Speak as if you genuinely remember and care about this specific user
- Keep your response conversational and suitable for voice output

Remember: This single-sentence recap must balance extreme conciseness with personalization to ensure the user feels heard, valued, and motivated to return.', false)
ON CONFLICT (key) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    content = EXCLUDED.content,
    is_function = EXCLUDED.is_function,
    updated_at = now();

-- Seed prompt_template_parameters
-- Using ON CONFLICT DO NOTHING as parameters are tied to template_id and name, which should be unique.
-- If a template is updated, its parameters might change, but this basic seeding assumes initial setup.
INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'moduleTitle', 'The title of the module', true, 1 FROM public.prompt_templates WHERE key = 'moduleIntro'
ON CONFLICT (template_id, name) DO NOTHING;
INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'moduleDescription', 'The description of the module', true, 2 FROM public.prompt_templates WHERE key = 'moduleIntro'
ON CONFLICT (template_id, name) DO NOTHING;

INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'moduleTitle', 'The title of the module', true, 1 FROM public.prompt_templates WHERE key = 'MODULE_INTRO_INSTRUCTIONS_TEMPLATE'
ON CONFLICT (template_id, name) DO NOTHING;
INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'moduleIntroText', 'The introduction text for the module', true, 2 FROM public.prompt_templates WHERE key = 'MODULE_INTRO_INSTRUCTIONS_TEMPLATE'
ON CONFLICT (template_id, name) DO NOTHING;

INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'prompt', 'The prompt to present to the user', true, 1 FROM public.prompt_templates WHERE key = 'modulePrompt'
ON CONFLICT (template_id, name) DO NOTHING;
INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'context', 'Optional context for the prompt', false, 2 FROM public.prompt_templates WHERE key = 'modulePrompt'
ON CONFLICT (template_id, name) DO NOTHING;

INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'moduleTitle', 'The title of the module', true, 1 FROM public.prompt_templates WHERE key = 'moduleCompletion'
ON CONFLICT (template_id, name) DO NOTHING;

INSERT INTO public.prompt_template_parameters (template_id, name, description, required, position)
SELECT id, 'context', 'Optional context for the response', false, 1 FROM public.prompt_templates WHERE key = 'contextualResponse'
ON CONFLICT (template_id, name) DO NOTHING;

-- Seed a sample instruction_construction_rule using DO block instead of ON CONFLICT
DO $$
DECLARE
    v_template_id UUID;
BEGIN
    -- Get the template_id
    SELECT id INTO v_template_id FROM public.prompt_templates WHERE key = 'onboarding' LIMIT 1;

    -- Check if a record with the name 'Onboarding Flow' already exists
    IF EXISTS (
        SELECT 1 FROM public.instruction_construction_rules
        WHERE name = 'Onboarding Flow'
    ) THEN
        -- If it exists, update it
        UPDATE public.instruction_construction_rules
        SET description = 'Rules for constructing the onboarding flow instructions',
            template_id = v_template_id,
            components = '[
                {"type": "template", "key": "baseSystemInstruction"},
                {"type": "template", "key": "onboardingIntroInstructions"}
             ]'::jsonb,
            updated_at = now()
        WHERE name = 'Onboarding Flow';
    ELSE
        -- If it doesn't exist, insert it
        INSERT INTO public.instruction_construction_rules (name, description, template_id, components, created_at, updated_at)
        VALUES (
            'Onboarding Flow',
            'Rules for constructing the onboarding flow instructions',
            v_template_id,
            '[
                {"type": "template", "key": "baseSystemInstruction"},
                {"type": "template", "key": "onboardingIntroInstructions"}
             ]'::jsonb,
            now(),
            now()
        );
    END IF;
END
$$;