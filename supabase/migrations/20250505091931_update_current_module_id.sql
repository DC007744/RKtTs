-- Migration: Update current_module_id based on current_chapter_id
-- Timestamp: 2025-05-05 09:19:31

-- Update current_module_id based on current_chapter_id
UPDATE public.user_sessions
SET current_module_id = CASE current_chapter_id
    WHEN '991f607e-b893-41c1-a233-5a0c83edd232' THEN 'onboarding'           -- Onboarding
    WHEN '78d2c48b-96c0-4456-8484-11e5eea230f2' THEN 'early_life'           -- The Basics
    WHEN '69e18012-86f8-4df2-9c88-2bdb0b38cf2d' THEN 'childhood'            -- The Game Begins
    WHEN 'fe15ff42-f022-4f7b-b744-0982dc257cc7' THEN 'adolescence'          -- The Rules Change
    WHEN '568ec3a1-dd31-4da5-866f-4c021249076d' THEN 'adulthood'            -- The Cost of the Game
    WHEN 'c411d941-e339-4fda-a431-f2021e7f8f91' THEN 'the_awakening'        -- The Awakening
    WHEN '394b34b2-c6d5-4990-a17a-85b0a5d10bc9' THEN 'the_reckoning'        -- The Reckoning
    WHEN 'dfc62e61-b126-428a-ba49-fa2bac46ac1e' THEN 'the_rebuild'          -- The Rebuild
    WHEN 'babbd94d-f2b0-4e52-9589-5ab657914f3c' THEN 'the_integration'      -- The Integration
    WHEN 'd72bf5ec-c42d-40b5-ba59-d067055f3ca3' THEN 'the_journey_all_along' -- The Journey All Along
    WHEN 'a7ebc8ad-9fa9-4215-81c4-c891cf2cebd4' THEN 'a_journey_that_makes_sense' -- A Journey That Makes Sense
    WHEN 'c2347d79-c29b-4709-8825-ff1a1f7ae4ed' THEN 'a_journey_to_wholeness' -- A Journey to Wholeness
    ELSE current_module_id -- Keep existing value if no match
END
WHERE current_chapter_id IS NOT NULL AND current_module_id IS NULL;

-- Set default current_module_id for records with NULL current_chapter_id and NULL current_module_id
UPDATE public.user_sessions
SET current_module_id = 'early_life'
WHERE current_chapter_id IS NULL AND current_module_id IS NULL;

-- Add comment to explain the purpose of this migration
COMMENT ON TABLE public.user_sessions IS 'User sessions with updated current_module_id for chapter navigation';