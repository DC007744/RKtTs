-- Add current_module_id column to user_sessions table if it doesn't exist
ALTER TABLE user_sessions
ADD COLUMN IF NOT EXISTS current_module_id text;

-- Add comment to explain the purpose of the column
COMMENT ON COLUMN user_sessions.current_module_id IS 'Stores the current module ID for chapter navigation';

-- Create an index on current_module_id for faster lookups
CREATE INDEX IF NOT EXISTS idx_user_sessions_current_module_id ON user_sessions(current_module_id);