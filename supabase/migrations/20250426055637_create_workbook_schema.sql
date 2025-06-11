-- Supabase migration SQL for creating the structured workbook schema

-- Create workbook_chapters table
CREATE TABLE public.workbook_chapters (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  number INTEGER NOT NULL,
  title TEXT NOT NULL,
  theme TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  is_active BOOLEAN DEFAULT TRUE,
  "order" INTEGER NOT NULL,
  UNIQUE(number)
);

-- Create reflection_questions table
CREATE TABLE public.reflection_questions (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  chapter_id UUID NOT NULL REFERENCES public.workbook_chapters(id) ON DELETE CASCADE,
  text TEXT NOT NULL,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  is_active BOOLEAN DEFAULT TRUE,
  UNIQUE(chapter_id, "order")
);

-- Create additional_prompts table
CREATE TABLE public.additional_prompts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  chapter_id UUID NOT NULL REFERENCES public.workbook_chapters(id) ON DELETE CASCADE,
  text TEXT NOT NULL,
  follow_up TEXT NOT NULL,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  is_active BOOLEAN DEFAULT TRUE,
  UNIQUE(chapter_id, "order")
);

-- Create workbook_sections table
CREATE TABLE public.workbook_sections (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  type TEXT NOT NULL CHECK (type IN ('personal_care_plan', 'four_seasons_reflection', 'final_reflection')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  is_active BOOLEAN DEFAULT TRUE,
  "order" INTEGER NOT NULL,
  UNIQUE(type)
);

-- Create section_prompts table
CREATE TABLE public.section_prompts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  section_id UUID NOT NULL REFERENCES public.workbook_sections(id) ON DELETE CASCADE,
  category TEXT,
  text TEXT NOT NULL,
  follow_up TEXT,
  "order" INTEGER NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  is_active BOOLEAN DEFAULT TRUE,
  UNIQUE(section_id, "order")
);

-- Add user progress tracking to user_sessions table
-- Check if columns exist before adding to avoid errors if migration is rerun
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'user_sessions' AND column_name = 'current_chapter_id') THEN
        ALTER TABLE public.user_sessions ADD COLUMN current_chapter_id UUID REFERENCES public.workbook_chapters(id);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'user_sessions' AND column_name = 'current_section_id') THEN
        ALTER TABLE public.user_sessions ADD COLUMN current_section_id UUID REFERENCES public.workbook_sections(id);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'user_sessions' AND column_name = 'current_prompt_id') THEN
        ALTER TABLE public.user_sessions ADD COLUMN current_prompt_id UUID;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'user_sessions' AND column_name = 'completed_prompts') THEN
        ALTER TABLE public.user_sessions ADD COLUMN completed_prompts UUID[] DEFAULT '{}';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'user_sessions' AND column_name = 'season_progress') THEN
        ALTER TABLE public.user_sessions ADD COLUMN season_progress JSONB DEFAULT '{"season1_complete": false, "season2_complete": false, "season3_complete": false, "season4_complete": false}';
    END IF;
END $$;


-- Create indexes for performance
-- Check if indexes exist before creating
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_reflection_questions_chapter_id') THEN
        CREATE INDEX idx_reflection_questions_chapter_id ON public.reflection_questions(chapter_id);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_additional_prompts_chapter_id') THEN
        CREATE INDEX idx_additional_prompts_chapter_id ON public.additional_prompts(chapter_id);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_section_prompts_section_id') THEN
        CREATE INDEX idx_section_prompts_section_id ON public.section_prompts(section_id);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_user_sessions_current_chapter_id') THEN
        CREATE INDEX idx_user_sessions_current_chapter_id ON public.user_sessions(current_chapter_id);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_user_sessions_current_section_id') THEN
        CREATE INDEX idx_user_sessions_current_section_id ON public.user_sessions(current_section_id);
    END IF;
END $$;

-- Note: RLS policies are not included in this migration as they were placeholders in the task document.