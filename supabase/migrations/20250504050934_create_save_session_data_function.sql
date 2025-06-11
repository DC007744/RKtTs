-- Create the save_session_data RPC
CREATE OR REPLACE FUNCTION save_session_data(
    p_session_id UUID, -- Parameter without default first
    p_chapter_id UUID DEFAULT NULL,
    p_reflection_questions_summary TEXT DEFAULT NULL,
    p_conversation_summary TEXT DEFAULT NULL,
    p_messages JSONB DEFAULT '[]' :: JSONB
)
RETURNS VOID
LANGUAGE plpgsql
AS $$
DECLARE
    msg JSONB;
BEGIN
    -- Start a transaction
    
    -- Update the user_sessions table with new metadata
    UPDATE user_sessions
    SET
        current_chapter_id = p_chapter_id, -- Corrected column name
        reflection_questions_summary = p_reflection_questions_summary,
        conversation_summary = p_conversation_summary,
        last_active = NOW() -- Also update last_active timestamp
    WHERE id = p_session_id;
    
    -- Insert messages into conversation_messages table
    FOR msg IN SELECT * FROM jsonb_array_elements(p_messages)
    LOOP
        INSERT INTO conversation_messages (session_id, role, content)
        VALUES (
            p_session_id,
            msg->>'role',
            msg->>'content'
        );
    END LOOP;
    
    -- Commit the transaction
    
EXCEPTION
    WHEN OTHERS THEN
        -- Log the error before rolling back
        RAISE NOTICE '[save_session_data] Error saving session %: %', p_session_id, SQLERRM;
        -- Rollback the transaction on error
        ROLLBACK;
        RAISE; -- Re-raise the exception
END;
$$;

-- -- Down migration to drop the RPC
-- DROP FUNCTION IF EXISTS save_session_data(UUID, UUID, TEXT, TEXT, JSONB);