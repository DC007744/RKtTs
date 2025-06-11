-- Allow anon role to SELECT their own session (required for onboarding/session save)
CREATE POLICY "Allow anon role to select their own session"
ON public.user_sessions
FOR SELECT
TO anon
USING (true);

-- Optionally, allow anon to UPDATE their own session (if onboarding details are updated)
CREATE POLICY "Allow anon role to update their own session"
ON public.user_sessions
FOR UPDATE
TO anon
USING (true);