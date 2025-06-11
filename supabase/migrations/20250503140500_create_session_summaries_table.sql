-- Create session_summaries table to store AI-generated summaries of conversation sessions
CREATE TABLE IF NOT EXISTS public.session_summaries (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id UUID NOT NULL REFERENCES public.user_sessions(id) ON DELETE CASCADE,
    summary TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ,
    UNIQUE(session_id)
);

-- Add RLS policies for session_summaries table
ALTER TABLE public.session_summaries ENABLE ROW LEVEL SECURITY;

-- Allow anonymous read access to session_summaries (relies on session_id foreign key constraint)
CREATE POLICY "Allow anonymous read access to session_summaries"
    ON public.session_summaries
    FOR SELECT
    USING (true);

-- Allow service role to insert/update session_summaries
CREATE POLICY "Allow service role to insert/update session_summaries"
    ON public.session_summaries
    FOR INSERT
    TO service_role
    WITH CHECK (true);

CREATE POLICY "Allow service role to update session_summaries"
    ON public.session_summaries
    FOR UPDATE
    TO service_role
    USING (true);

-- Add comment to the table
COMMENT ON TABLE public.session_summaries IS 'Stores AI-generated summaries of conversation sessions';