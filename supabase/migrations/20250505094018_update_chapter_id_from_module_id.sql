-- Migration: Update current_chapter_id based on current_module_id and add missing index
-- Timestamp: 2025-05-05 09:40:18

-- Add missing index on current_module_id (do this first as it's less likely to fail)
CREATE INDEX IF NOT EXISTS idx_user_sessions_current_module_id ON public.user_sessions(current_module_id);

-- Update current_chapter_id based on current_module_id for all user sessions
-- Only update if the chapter exists in workbook_chapters table (using EXISTS subquery)
UPDATE public.user_sessions
SET current_chapter_id = CASE current_module_id
    WHEN 'onboarding' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 0 LIMIT 1)
    WHEN 'early_life' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 1 LIMIT 1)
    WHEN 'childhood' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 2 LIMIT 1)
    WHEN 'adolescence' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 3 LIMIT 1)
    WHEN 'adulthood' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 4 LIMIT 1)
    WHEN 'the_awakening' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 5 LIMIT 1)
    WHEN 'the_reckoning' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 6 LIMIT 1)
    WHEN 'the_rebuild' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 7 LIMIT 1)
    WHEN 'the_integration' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 8 LIMIT 1)
    WHEN 'the_journey_all_along' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 9 LIMIT 1)
    WHEN 'a_journey_that_makes_sense' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 10 LIMIT 1)
    WHEN 'a_journey_to_wholeness' THEN 
        (SELECT id FROM workbook_chapters WHERE number = 11 LIMIT 1)
    ELSE current_chapter_id -- Keep existing value if no match
END
WHERE current_module_id IS NOT NULL
AND CASE current_module_id
    WHEN 'onboarding' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 0)
    WHEN 'early_life' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 1)
    WHEN 'childhood' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 2)
    WHEN 'adolescence' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 3)
    WHEN 'adulthood' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 4)
    WHEN 'the_awakening' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 5)
    WHEN 'the_reckoning' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 6)
    WHEN 'the_rebuild' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 7)
    WHEN 'the_integration' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 8)
    WHEN 'the_journey_all_along' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 9)
    WHEN 'a_journey_that_makes_sense' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 10)
    WHEN 'a_journey_to_wholeness' THEN EXISTS (SELECT 1 FROM workbook_chapters WHERE number = 11)
    ELSE TRUE -- Skip this check for other values
END;

-- Add comment to explain the purpose of this migration
COMMENT ON TABLE public.user_sessions IS 'User sessions with synchronized current_chapter_id and current_module_id';