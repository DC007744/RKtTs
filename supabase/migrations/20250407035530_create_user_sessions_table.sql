-- Migration script to create the 'user_sessions' table

-- 1. Create the table
CREATE TABLE public.user_sessions (
    id uuid PRIMARY KEY, -- Matches localStorage.sessionId, provided by client on insert
    name text,
    age integer,
    motivation text,
    onboarding_complete boolean NOT NULL DEFAULT false,
    last_active timestamptz NOT NULL DEFAULT now(),
    modules jsonb -- Stores array of ModuleProgress objects
);

-- 2. Add comments for clarity
COMMENT ON TABLE public.user_sessions IS 'Stores detailed session data for users, linked by a client-generated session ID.';
COMMENT ON COLUMN public.user_sessions.id IS 'Client-generated unique session identifier (from localStorage).';
COMMENT ON COLUMN public.user_sessions.name IS 'User''s provided first name.';
COMMENT ON COLUMN public.user_sessions.age IS 'User''s provided age (optional).';
COMMENT ON COLUMN public.user_sessions.motivation IS 'User''s stated motivation for using the app.';
COMMENT ON COLUMN public.user_sessions.onboarding_complete IS 'Flag indicating if the user has completed the onboarding flow.';
COMMENT ON COLUMN public.user_sessions.last_active IS 'Timestamp of the last user activity.';
COMMENT ON COLUMN public.user_sessions.modules IS 'JSONB array storing progress for each module (ModuleProgress[]).';

-- 3. Enable Row Level Security (RLS)
ALTER TABLE public.user_sessions ENABLE ROW LEVEL SECURITY;

-- 4. Create RLS policies
-- Policy: Allow users to read/update their own session data
-- Assumes a way to match auth.uid() to the session ID, which might require a mapping table or custom function.
-- For now, let's allow authenticated users SELECT/UPDATE access. Refine later if needed.
CREATE POLICY "Allow authenticated users read/update access"
ON public.user_sessions
FOR ALL -- Using FOR ALL for simplicity, could split SELECT/UPDATE/INSERT
TO authenticated
USING (true) -- Placeholder: Needs refinement based on how session_id relates to auth.uid()
WITH CHECK (true); -- Placeholder

-- Policy: Allow service_role full access (for backend operations)
CREATE POLICY "Allow service_role full access"
ON public.user_sessions
FOR ALL
TO service_role
USING (true);

-- 5. Grant permissions
-- Grant usage on the schema to roles (if not already granted)
-- GRANT USAGE ON SCHEMA public TO authenticated;
-- GRANT USAGE ON SCHEMA public TO service_role;

-- Grant permissions to authenticated users (as per policy)
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.user_sessions TO authenticated; -- Allowing INSERT/DELETE for now, might restrict later

-- Grant ALL permissions to service_role (as per policy)
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.user_sessions TO service_role;

-- Note: Anon role typically should NOT have access to user sessions.