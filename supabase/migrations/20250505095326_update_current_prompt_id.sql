-- Migration: Update current_prompt_id based on current_chapter_id
-- Timestamp: 2025-05-05 09:53:26

-- Update current_prompt_id for user sessions with a valid current_chapter_id but NULL current_prompt_id
-- First, try to set it to the first reflection question for the chapter
UPDATE public.user_sessions
SET current_prompt_id = (
    SELECT id 
    FROM public.reflection_questions 
    WHERE chapter_id = user_sessions.current_chapter_id 
    AND is_active = true
    ORDER BY "order" ASC 
    LIMIT 1
)
WHERE current_chapter_id IS NOT NULL 
AND current_prompt_id IS NULL
AND EXISTS (
    SELECT 1 
    FROM public.reflection_questions 
    WHERE chapter_id = user_sessions.current_chapter_id 
    AND is_active = true
);

-- If there are no reflection questions, try to set it to the first additional prompt for the chapter
UPDATE public.user_sessions
SET current_prompt_id = (
    SELECT id 
    FROM public.additional_prompts 
    WHERE chapter_id = user_sessions.current_chapter_id 
    AND is_active = true
    ORDER BY "order" ASC 
    LIMIT 1
)
WHERE current_chapter_id IS NOT NULL 
AND current_prompt_id IS NULL
AND EXISTS (
    SELECT 1 
    FROM public.additional_prompts 
    WHERE chapter_id = user_sessions.current_chapter_id 
    AND is_active = true
);

-- Add comment to explain the purpose of this migration
COMMENT ON TABLE public.user_sessions IS 'User sessions with synchronized current_chapter_id, current_module_id, and current_prompt_id';