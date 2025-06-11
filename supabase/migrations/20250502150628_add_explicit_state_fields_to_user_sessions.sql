-- Migration: Add explicit state fields to user_sessions
-- Timestamp: 2025-05-02 15:06:28
-- NOTE: This migration is marked as a no-op because the columns already exist in the database.
-- This file exists to record the migration in the schema_migrations table without applying the changes again.

-- Original SQL commented out:
/*
ALTER TABLE public.user_sessions
  ADD COLUMN current_chapter_id UUID REFERENCES public.workbook_chapters(id),
  ADD COLUMN current_section_id UUID REFERENCES public.workbook_sections(id),
  ADD COLUMN current_prompt_id UUID;

-- Add indexes for foreign keys (recommended for performance)
CREATE INDEX IF NOT EXISTS idx_user_sessions_current_chapter_id ON public.user_sessions(current_chapter_id);
CREATE INDEX IF NOT EXISTS idx_user_sessions_current_section_id ON public.user_sessions(current_section_id);

-- Optionally, you may want to add a comment for clarity
COMMENT ON COLUMN public.user_sessions.current_chapter_id IS 'Current chapter in the workbook for the session';
COMMENT ON COLUMN public.user_sessions.current_section_id IS 'Current section in the workbook for the session (nullable)';
COMMENT ON COLUMN public.user_sessions.current_prompt_id IS 'Current prompt in the session (nullable)';
*/

-- No-op statement to ensure the migration is recorded
SELECT 1;