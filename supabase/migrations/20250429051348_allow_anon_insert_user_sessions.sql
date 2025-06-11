-- Migration: Allow anon role to insert new user sessions (RLS policy fix)
-- Created: 2025-04-28

-- 1. Create a new RLS policy for anon INSERT
CREATE POLICY "Allow anon role to insert new sessions"
ON public.user_sessions
FOR INSERT
TO anon
WITH CHECK (true);

-- 2. Grant INSERT permission to anon role
GRANT INSERT ON TABLE public.user_sessions TO anon;

-- 3. Document the policy
COMMENT ON POLICY "Allow anon role to insert new sessions" ON public.user_sessions
IS 'Allows the anon role to create new user sessions during initial session creation. This is required for the application to function when using the anon key.';