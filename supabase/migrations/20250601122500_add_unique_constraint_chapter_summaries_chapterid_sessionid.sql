-- Migration: Add unique constraint on (chapter_id, session_id) to chapter_summaries
ALTER TABLE chapter_summaries
ADD CONSTRAINT chapter_summaries_chapter_id_session_id_key UNIQUE (chapter_id, session_id);