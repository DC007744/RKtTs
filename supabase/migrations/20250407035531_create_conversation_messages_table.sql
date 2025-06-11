-- Migration script to create the 'conversation_messages' table

-- 1. Create the table
CREATE TABLE public.conversation_messages (
    id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id uuid NOT NULL REFERENCES public.user_sessions(id) ON DELETE CASCADE, -- Foreign key to user_sessions
    timestamp timestamptz NOT NULL DEFAULT now(),
    role text NOT NULL CHECK (role IN ('user', 'assistant')),
    content text NOT NULL
);

-- 2. Add comments for clarity
COMMENT ON TABLE public.conversation_messages IS 'Stores individual messages for each conversation session.';
COMMENT ON COLUMN public.conversation_messages.id IS 'Unique identifier for the message.';
COMMENT ON COLUMN public.conversation_messages.session_id IS 'References the user session this message belongs to.';
COMMENT ON COLUMN public.conversation_messages.timestamp IS 'When the message was recorded.';
COMMENT ON COLUMN public.conversation_messages.role IS 'Who sent the message (''user'' or ''assistant'').';
COMMENT ON COLUMN public.conversation_messages.content IS 'The text content of the message.';

-- 3. Create indexes for performance
CREATE INDEX idx_conversation_messages_session_id_timestamp ON public.conversation_messages(session_id, timestamp);

-- 4. Enable Row Level Security (RLS)
ALTER TABLE public.conversation_messages ENABLE ROW LEVEL SECURITY;

-- 5. Create RLS policies
-- Policy: Allow authenticated users to read messages (TEMPORARY DEBUGGING - INSECURE)
-- TODO: Refine this policy based on actual auth/session linkage.
CREATE POLICY "Allow authenticated users to read"
ON public.conversation_messages
FOR SELECT
TO authenticated
USING (true); -- Temporarily allow any authenticated user to read for debugging API retrieval

-- Policy: Allow service_role full access (for backend operations like saving messages)
CREATE POLICY "Allow service_role full access"
ON public.conversation_messages
FOR ALL
TO service_role
USING (true);

-- Policy: Allow anon users to read messages (TEMPORARY DEBUGGING - INSECURE)
-- TODO: Remove or secure this policy before production.
CREATE POLICY "Allow anon users to read"
ON public.conversation_messages
FOR SELECT
TO anon
USING (true); -- Temporarily allow any anon user to read for debugging API retrieval

-- 6. Grant permissions
-- Grant usage on the schema to roles (if not already granted)
-- GRANT USAGE ON SCHEMA public TO authenticated;
-- GRANT USAGE ON SCHEMA public TO service_role;

-- Grant SELECT to authenticated users (as per policy)
GRANT SELECT ON TABLE public.conversation_messages TO authenticated;

-- Grant ALL permissions to service_role (as per policy)
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE public.conversation_messages TO service_role;

-- Grant SELECT to anon role (TEMPORARY DEBUGGING - INSECURE)
GRANT SELECT ON TABLE public.conversation_messages TO anon;

-- Note: Anon role typically should NOT have access to conversation messages.