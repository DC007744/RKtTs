-- Seed data for user_sessions and conversation_messages tables
-- Target user ID: f3b7ec31-502c-46e5-a01e-61ffda242c1f

-- First, add the missing columns to user_sessions if they don't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'user_sessions' AND column_name = 'chapter_id') THEN
        ALTER TABLE public.user_sessions ADD COLUMN chapter_id uuid REFERENCES public.workbook_chapters(id);
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'user_sessions' AND column_name = 'reflection_questions_summary') THEN
        ALTER TABLE public.user_sessions ADD COLUMN reflection_questions_summary text;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name = 'user_sessions' AND column_name = 'conversation_summary') THEN
        ALTER TABLE public.user_sessions ADD COLUMN conversation_summary text;
    END IF;
END
$$;

-- Create 3 user sessions with different last_active timestamps within the last week
INSERT INTO public.user_sessions (
  id, 
  name, 
  age, 
  motivation, 
  onboarding_complete, 
  last_active, 
  modules, 
  current_chapter_id, 
  current_section_id, 
  current_prompt_id, 
  completed_prompts, 
  season_progress, 
  onboarding_step_index,
  chapter_id,
  reflection_questions_summary,
  conversation_summary
) VALUES 
-- Session 1: Most recent session (yesterday)
(
  'f3b7ec31-502c-46e5-a01e-61ffda242c1f', 
  'John', 
  35, 
  'I want to understand myself better and improve my relationships', 
  TRUE, 
  NOW() - INTERVAL '1 day', 
  '[{"id":"early_life","status":"completed","progress":1.0},{"id":"relationships","status":"in_progress","progress":0.5}]'::jsonb, 
  (SELECT id FROM public.workbook_chapters WHERE number = 0), -- Onboarding chapter
  NULL, -- No section ID since there are none in the database
  'f934c5d0-ae91-4e78-9de2-4855f68e9124', -- First reflection question
  ARRAY['f934c5d0-ae91-4e78-9de2-4855f68e9124'::uuid, '3defb362-b45a-481b-9ee6-cd82377230a7'::uuid], 
  '{"season1_complete": true, "season2_complete": false, "season3_complete": false, "season4_complete": false}'::jsonb, 
  5,
  (SELECT id FROM public.workbook_chapters WHERE number = 0),
  'John reflected on his childhood experiences, noting how his parents'' divorce affected his trust in relationships. He identified patterns of seeking approval and avoiding conflict that originated in his early family dynamics.',
  'Session focused on early life experiences and their impact on current relationship patterns. John showed insight into how childhood events shaped his adult behaviors.'
),

-- Session 2: 3 days ago
(
  '2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b', 
  'John', 
  35, 
  'I want to understand myself better and improve my relationships', 
  TRUE, 
  NOW() - INTERVAL '3 days', 
  '[{"id":"early_life","status":"completed","progress":1.0},{"id":"relationships","status":"not_started","progress":0.0}]'::jsonb, 
  (SELECT id FROM public.workbook_chapters WHERE number = 1), -- The Basics chapter
  NULL, -- No section ID
  '451238bc-37a0-4c71-a6b6-d79ff5923702', -- Third reflection question
  ARRAY['f934c5d0-ae91-4e78-9de2-4855f68e9124'::uuid], 
  '{"season1_complete": true, "season2_complete": false, "season3_complete": false, "season4_complete": false}'::jsonb, 
  5,
  (SELECT id FROM public.workbook_chapters WHERE number = 1),
  'John discussed challenges he faced as a teenager, including academic pressure and social anxiety. He recognized how these experiences helped him develop resilience and problem-solving skills.',
  'Session explored formative challenges and their contribution to personal growth. John identified both positive and negative coping mechanisms developed during this period.'
),

-- Session 3: 6 days ago
(
  '3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f', 
  'John', 
  35, 
  'I want to understand myself better and improve my relationships', 
  TRUE, 
  NOW() - INTERVAL '6 days', 
  '[{"id":"early_life","status":"in_progress","progress":0.7}]'::jsonb, 
  (SELECT id FROM public.workbook_chapters WHERE number = 2), -- The Game Begins chapter
  NULL, -- No section ID
  '0ac662c3-e1d4-437b-93c4-12a74a8b0e8c', -- Fourth reflection question
  ARRAY[]::uuid[], 
  '{"season1_complete": false, "season2_complete": false, "season3_complete": false, "season4_complete": false}'::jsonb, 
  5,
  (SELECT id FROM public.workbook_chapters WHERE number = 2),
  'John shared memories of his first day at school and how it shaped his approach to new situations. He noted patterns of initial hesitation followed by adaptation that continue in his adult life.',
  'Initial exploration of early memories and their lasting impact. John began connecting childhood experiences to current behavioral patterns.'
)
ON CONFLICT (id) DO UPDATE 
SET 
  name = EXCLUDED.name,
  age = EXCLUDED.age,
  motivation = EXCLUDED.motivation,
  onboarding_complete = EXCLUDED.onboarding_complete,
  last_active = EXCLUDED.last_active,
  modules = EXCLUDED.modules,
  current_chapter_id = EXCLUDED.current_chapter_id,
  current_prompt_id = EXCLUDED.current_prompt_id,
  completed_prompts = EXCLUDED.completed_prompts,
  season_progress = EXCLUDED.season_progress,
  onboarding_step_index = EXCLUDED.onboarding_step_index,
  chapter_id = EXCLUDED.chapter_id,
  reflection_questions_summary = EXCLUDED.reflection_questions_summary,
  conversation_summary = EXCLUDED.conversation_summary;

-- Create conversation messages for each session
-- Session 1 conversation (4 messages)
INSERT INTO public.conversation_messages (
  id,
  session_id,
  timestamp,
  role,
  content
) VALUES
(
  gen_random_uuid(),
  'f3b7ec31-502c-46e5-a01e-61ffda242c1f',
  NOW() - INTERVAL '1 day 2 hours',
  'assistant',
  'Reflect on how early experiences shaped your identity and values. Which moments or lessons stand out as significant?'
),
(
  gen_random_uuid(),
  'f3b7ec31-502c-46e5-a01e-61ffda242c1f',
  NOW() - INTERVAL '1 day 1 hour 55 minutes',
  'user',
  'My parents'' divorce when I was 10 really shaped me. I learned that relationships can be fragile, which made me cautious about trusting others completely. On the positive side, my grandmother taught me the value of persistence - she always said "steady wins the race" and showed me how consistent effort pays off.'
),
(
  gen_random_uuid(),
  'f3b7ec31-502c-46e5-a01e-61ffda242c1f',
  NOW() - INTERVAL '1 day 1 hour 50 minutes',
  'assistant',
  'Thank you for sharing that, John. The experience of your parents'' divorce clearly had a profound impact on how you approach trust in relationships. It''s common for children of divorce to develop a certain caution or hesitancy in their own relationships. At the same time, your grandmother provided an important counterbalance with her wisdom about persistence. How do you think these two influences - the caution from witnessing your parents'' relationship end, and the value of persistence from your grandmother - play out in your life today?'
),
(
  gen_random_uuid(),
  'f3b7ec31-502c-46e5-a01e-61ffda242c1f',
  NOW() - INTERVAL '1 day 1 hour 45 minutes',
  'user',
  'I think they''re constantly in tension. In relationships, I''m always looking for signs that things might fall apart, which sometimes makes me pull back when I should be leaning in. But my grandmother''s influence helps me stick with things even when they get difficult. I''ve stayed in my current job for 8 years, even through tough periods, and I''m proud of that persistence. I''m trying to bring more of that steadiness to my personal relationships too.'
),

-- Session 2 conversation (3 messages)
(
  gen_random_uuid(),
  '2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b',
  NOW() - INTERVAL '3 days 3 hours',
  'assistant',
  'Consider early challenges or responsibilities you faced. How did they build resilience or reveal your strengths?'
),
(
  gen_random_uuid(),
  '2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b',
  NOW() - INTERVAL '3 days 2 hours 55 minutes',
  'user',
  'In high school, I struggled with social anxiety while also facing pressure to excel academically. I developed a system of preparing extensively for any social situation or test, which helped me manage my anxiety. This revealed my strength in planning and preparation, but also my tendency to overthink things. I also became the person friends would come to with problems, which showed me I had a natural ability to listen and provide perspective.'
),
(
  gen_random_uuid(),
  '2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b',
  NOW() - INTERVAL '3 days 2 hours 50 minutes',
  'assistant',
  'You''ve identified some important patterns there, John. Your response to anxiety through preparation has become a double-edged sword - providing you with a valuable skill in planning and organization, while sometimes leading to overthinking. And it''s interesting how you became a confidant for friends, developing listening skills even while managing your own social anxiety. These early adaptations often become lifelong patterns. How do you see these strengths and tendencies showing up in your current life? Are there situations where your preparation serves you well, and others where it might hold you back?'
),

-- Session 3 conversation (3 messages)
(
  gen_random_uuid(),
  '3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f',
  NOW() - INTERVAL '6 days 1 hour',
  'assistant',
  'Let''s start with your early years. Can you share a specific memory from your childhood that stands out? What did it teach you about yourself or your place in the world?'
),
(
  gen_random_uuid(),
  '3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f',
  NOW() - INTERVAL '6 days 55 minutes',
  'user',
  'I remember my first day of kindergarten vividly. I was terrified and clung to my mom''s leg, refusing to go in. The teacher had to gently pry me away. But by lunchtime, I was playing with other kids and didn''t want to leave when my mom came to pick me up. I think this taught me that I''m initially resistant to new situations but can adapt quickly once I give them a chance. This pattern has repeated throughout my life - new jobs, moving to new cities, meeting new people. I always dread the change but end up embracing it.'
),
(
  gen_random_uuid(),
  '3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f',
  NOW() - INTERVAL '6 days 50 minutes',
  'assistant',
  'That''s a powerful insight, John. This pattern of initial resistance followed by adaptation has been consistent throughout your life. It shows both your natural caution and your underlying flexibility and resilience. Many people struggle with transitions their entire lives, but you''ve recognized your pattern: the initial fear followed by successful adaptation. This self-awareness is valuable. When you face new situations now, does recognizing this pattern help you move through the initial resistance more easily? Or do you still experience that same intensity of dread despite knowing you''ll likely adapt well?'
);