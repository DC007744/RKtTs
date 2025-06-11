-- migrate:up
-- Add reflection_questions_summary and conversation_summary columns to user_sessions
-- Note: chapter_id is handled by an earlier migration (20250503201718_add_chapter_id_to_user_sessions.sql)
-- which named the column current_chapter_id.
ALTER TABLE user_sessions
ADD COLUMN IF NOT EXISTS reflection_questions_summary TEXT NULL,
ADD COLUMN IF NOT EXISTS conversation_summary TEXT NULL;

