-- This migration adds the onboarding_step_index column to the user_sessions table.
ALTER TABLE user_sessions ADD COLUMN onboarding_step_index INTEGER;

