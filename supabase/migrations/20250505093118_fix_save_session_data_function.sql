-- Migration: Fix save_session_data function with correct parameter order
-- Timestamp: 2025-05-05 09:31:18

-- Drop the existing function if it exists
DROP FUNCTION IF EXISTS public.save_session_data(p_session_id UUID, p_chapter_id UUID, p_reflection_questions_summary TEXT, p_conversation_summary TEXT, p_messages JSONB);

-- Create the save_session_data function with the correct parameter order
-- IMPORTANT: The parameter order must match exactly what the application expects:
-- (p_chapter_id, p_conversation_summary, p_messages, p_reflection_questions_summary, p_session_id)
CREATE OR REPLACE FUNCTION public.save_session_data(
    p_chapter_id UUID,
    p_conversation_summary TEXT,
    p_messages JSONB,
    p_reflection_questions_summary TEXT,
    p_session_id UUID
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE
    msg JSONB;
BEGIN
    -- Start a transaction explicitly
    BEGIN
        -- Update the user_sessions table with new metadata
        UPDATE user_sessions
        SET
            chapter_id = p_chapter_id,
            conversation_summary = p_conversation_summary,
            reflection_questions_summary = p_reflection_questions_summary,
            last_active = NOW() -- Also update last_active timestamp
        WHERE id = p_session_id;
        
        -- Insert messages into conversation_messages table
        IF p_messages IS NOT NULL AND jsonb_array_length(p_messages) > 0 THEN
            FOR msg IN SELECT * FROM jsonb_array_elements(p_messages)
            LOOP
                INSERT INTO conversation_messages (session_id, role, content)
                VALUES (
                    p_session_id,
                    msg->>'role',
                    msg->>'content'
                );
            END LOOP;
        END IF;
        
        -- Commit the transaction explicitly
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- Log the error before rolling back
            RAISE NOTICE '[save_session_data] Error saving session %: %', p_session_id, SQLERRM;
            -- Rollback the transaction on error
            ROLLBACK;
            RAISE; -- Re-raise the exception
    END;
END;
$$;

-- Add a comment to explain the function
COMMENT ON FUNCTION public.save_session_data(UUID, TEXT, JSONB, TEXT, UUID) IS 'Saves session data including messages and metadata with the parameter order expected by the application';