-- Add chapter_id column to user_sessions table
ALTER TABLE user_sessions
ADD COLUMN chapter_id UUID;