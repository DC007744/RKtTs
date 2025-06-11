SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: workbook_chapters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."workbook_chapters" ("id", "number", "title", "theme", "created_at", "updated_at", "is_active", "order", "slug") VALUES
	('d2de6ef2-8298-4c9a-a287-31b85585617d', 0, 'Onboarding', 'onboarding', '2025-05-26 11:06:26.525011+00', '2025-05-26 11:06:26.525011+00', true, 0, 'onboarding'),
	('3c75bec4-5baf-4b50-ad61-94807d7f69b2', 1, 'The Basics', 'Early experiences shaping identity and worth', '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true, 1, 'the-basics'),
	('a0a54e4b-a359-4917-90ff-a36fbfb267ea', 2, 'The Game Begins', 'Entering the pursuit of success and external validation', '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true, 2, 'the-game-begins'),
	('561963b6-7310-4940-a7d5-aa70c4ad856c', 3, 'The Rules Change', 'Facing unexpected shifts and adapting to new realities', '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true, 3, 'the-rules-change'),
	('12f97696-d867-424a-9c54-b513b09f18de', 4, 'The Cost of the Game', 'Recognizing the sacrifices made in pursuit of achievement', '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true, 4, 'the-cost-of-the-game'),
	('886c5791-3cd3-43fc-a43b-83862d60ecbf', 5, 'The Awakening', 'Encountering a moment of truth or self-realization', '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true, 5, 'the-awakening'),
	('b1551968-33a9-425e-b3aa-ff6298c27c03', 6, 'The Reckoning', 'Confronting consequences and taking responsibility', '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true, 6, 'the-reckoning'),
	('fea12d3f-4488-4743-9dbc-c11875930032', 7, 'The Rebuild', 'Reconstructing life with new priorities and purpose', '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true, 7, 'the-rebuild'),
	('ec7c7fa0-6eae-4c69-83cb-7cf73e5390db', 8, 'The Integration', 'Connecting past lessons to present growth', '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true, 8, 'the-integration'),
	('4a35209a-5cf5-4a71-8f98-253cc52111de', 9, 'The Journey All Along', 'Integrating life’s seasons through spiritual awareness and purpose', '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true, 9, 'the-journey-all-along'),
	('87623028-2e95-43ba-9e87-6a444c30b243', 10, 'A Journey That Makes Sense', 'Using intellect and environment for personal growth', '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true, 10, 'a-journey-that-makes-sense'),
	('f541ef1e-dca8-450f-aa5f-af76ae2efd5e', 11, 'A Journey to Wholeness', 'Redefining success and integrating life’s aspects', '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true, 11, 'a-journey-to-wholeness');


--
-- Data for Name: additional_prompts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: workbook_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."user_sessions" ("id", "name", "age", "motivation", "onboarding_complete", "last_active", "modules", "current_chapter_id", "current_section_id", "current_prompt_id", "completed_prompts", "season_progress", "onboarding_step_index", "chapter_id", "reflection_questions_summary", "conversation_summary", "current_module_id", "current_module_slug") VALUES
	('f3b7ec31-502c-46e5-a01e-61ffda242c1f', 'John', 35, 'I want to understand myself better and improve my relationships', true, '2025-05-25 11:06:26.550092+00', '[{"id": "early_life", "status": "completed", "progress": 1.0}, {"id": "relationships", "status": "in_progress", "progress": 0.5}]', 'd2de6ef2-8298-4c9a-a287-31b85585617d', NULL, 'f934c5d0-ae91-4e78-9de2-4855f68e9124', '{f934c5d0-ae91-4e78-9de2-4855f68e9124,3defb362-b45a-481b-9ee6-cd82377230a7}', '{"season1_complete": true, "season2_complete": false, "season3_complete": false, "season4_complete": false}', 5, 'd2de6ef2-8298-4c9a-a287-31b85585617d', 'John reflected on his childhood experiences, noting how his parents'' divorce affected his trust in relationships. He identified patterns of seeking approval and avoiding conflict that originated in his early family dynamics.', 'Session focused on early life experiences and their impact on current relationship patterns. John showed insight into how childhood events shaped his adult behaviors.', NULL, NULL),
	('2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b', 'John', 35, 'I want to understand myself better and improve my relationships', true, '2025-05-23 11:06:26.550092+00', '[{"id": "early_life", "status": "completed", "progress": 1.0}, {"id": "relationships", "status": "not_started", "progress": 0.0}]', '3c75bec4-5baf-4b50-ad61-94807d7f69b2', NULL, '451238bc-37a0-4c71-a6b6-d79ff5923702', '{f934c5d0-ae91-4e78-9de2-4855f68e9124}', '{"season1_complete": true, "season2_complete": false, "season3_complete": false, "season4_complete": false}', 5, '3c75bec4-5baf-4b50-ad61-94807d7f69b2', 'John discussed challenges he faced as a teenager, including academic pressure and social anxiety. He recognized how these experiences helped him develop resilience and problem-solving skills.', 'Session explored formative challenges and their contribution to personal growth. John identified both positive and negative coping mechanisms developed during this period.', NULL, NULL),
	('3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f', 'John', 35, 'I want to understand myself better and improve my relationships', true, '2025-05-20 11:06:26.550092+00', '[{"id": "early_life", "status": "in_progress", "progress": 0.7}]', 'a0a54e4b-a359-4917-90ff-a36fbfb267ea', NULL, '0ac662c3-e1d4-437b-93c4-12a74a8b0e8c', '{}', '{"season1_complete": false, "season2_complete": false, "season3_complete": false, "season4_complete": false}', 5, 'a0a54e4b-a359-4917-90ff-a36fbfb267ea', 'John shared memories of his first day at school and how it shaped his approach to new situations. He noted patterns of initial hesitation followed by adaptation that continue in his adult life.', 'Initial exploration of early memories and their lasting impact. John began connecting childhood experiences to current behavioral patterns.', NULL, NULL);


--
-- Data for Name: conversation_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."conversation_messages" ("id", "session_id", "timestamp", "role", "content") VALUES
	('0950646c-ede3-4bb4-9ac4-87133c77a0b1', 'f3b7ec31-502c-46e5-a01e-61ffda242c1f', '2025-05-25 09:06:26.550092+00', 'assistant', 'Reflect on how early experiences shaped your identity and values. Which moments or lessons stand out as significant?'),
	('6130cb7c-99e4-4479-b20d-a51ed07a3825', 'f3b7ec31-502c-46e5-a01e-61ffda242c1f', '2025-05-25 09:11:26.550092+00', 'user', 'My parents'' divorce when I was 10 really shaped me. I learned that relationships can be fragile, which made me cautious about trusting others completely. On the positive side, my grandmother taught me the value of persistence - she always said "steady wins the race" and showed me how consistent effort pays off.'),
	('05162cca-bf0c-46e8-9432-00cd0d922c35', 'f3b7ec31-502c-46e5-a01e-61ffda242c1f', '2025-05-25 09:16:26.550092+00', 'assistant', 'Thank you for sharing that, John. The experience of your parents'' divorce clearly had a profound impact on how you approach trust in relationships. It''s common for children of divorce to develop a certain caution or hesitancy in their own relationships. At the same time, your grandmother provided an important counterbalance with her wisdom about persistence. How do you think these two influences - the caution from witnessing your parents'' relationship end, and the value of persistence from your grandmother - play out in your life today?'),
	('acb35863-b343-4fb7-bac6-e8a7e1dedf69', 'f3b7ec31-502c-46e5-a01e-61ffda242c1f', '2025-05-25 09:21:26.550092+00', 'user', 'I think they''re constantly in tension. In relationships, I''m always looking for signs that things might fall apart, which sometimes makes me pull back when I should be leaning in. But my grandmother''s influence helps me stick with things even when they get difficult. I''ve stayed in my current job for 8 years, even through tough periods, and I''m proud of that persistence. I''m trying to bring more of that steadiness to my personal relationships too.'),
	('b267faa0-8696-42da-8169-a8fbb7619f00', '2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b', '2025-05-23 08:06:26.550092+00', 'assistant', 'Consider early challenges or responsibilities you faced. How did they build resilience or reveal your strengths?'),
	('4059b010-c270-406d-8393-dbb5ef728c65', '2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b', '2025-05-23 08:11:26.550092+00', 'user', 'In high school, I struggled with social anxiety while also facing pressure to excel academically. I developed a system of preparing extensively for any social situation or test, which helped me manage my anxiety. This revealed my strength in planning and preparation, but also my tendency to overthink things. I also became the person friends would come to with problems, which showed me I had a natural ability to listen and provide perspective.'),
	('9336876f-30d0-4774-808c-a853728cb341', '2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b', '2025-05-23 08:16:26.550092+00', 'assistant', 'You''ve identified some important patterns there, John. Your response to anxiety through preparation has become a double-edged sword - providing you with a valuable skill in planning and organization, while sometimes leading to overthinking. And it''s interesting how you became a confidant for friends, developing listening skills even while managing your own social anxiety. These early adaptations often become lifelong patterns. How do you see these strengths and tendencies showing up in your current life? Are there situations where your preparation serves you well, and others where it might hold you back?'),
	('2ada0bd1-16fc-4fb4-96f8-2c94a303ae45', '3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f', '2025-05-20 10:06:26.550092+00', 'assistant', 'Let''s start with your early years. Can you share a specific memory from your childhood that stands out? What did it teach you about yourself or your place in the world?'),
	('0a634ecd-2288-4b11-aabf-63f1cd6d7563', '3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f', '2025-05-20 10:11:26.550092+00', 'user', 'I remember my first day of kindergarten vividly. I was terrified and clung to my mom''s leg, refusing to go in. The teacher had to gently pry me away. But by lunchtime, I was playing with other kids and didn''t want to leave when my mom came to pick me up. I think this taught me that I''m initially resistant to new situations but can adapt quickly once I give them a chance. This pattern has repeated throughout my life - new jobs, moving to new cities, meeting new people. I always dread the change but end up embracing it.'),
	('2daa61de-d4ea-40a4-8151-259d0c896e89', '3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f', '2025-05-20 10:16:26.550092+00', 'assistant', 'That''s a powerful insight, John. This pattern of initial resistance followed by adaptation has been consistent throughout your life. It shows both your natural caution and your underlying flexibility and resilience. Many people struggle with transitions their entire lives, but you''ve recognized your pattern: the initial fear followed by successful adaptation. This self-awareness is valuable. When you face new situations now, does recognizing this pattern help you move through the initial resistance more easily? Or do you still experience that same intensity of dread despite knowing you''ll likely adapt well?');


--
-- Data for Name: health_check; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."health_check" ("id", "status", "checked_at") VALUES
	(1, 'ok', '2025-05-26 11:06:26.427492+00');


--
-- Data for Name: prompt_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."prompt_templates" ("id", "key", "name", "description", "content", "is_function", "created_at", "updated_at") VALUES
	('04220f07-81bf-40c6-9911-a5dd6068d94f', 'baseSystemInstruction', 'Base System Instruction', 'The base system instruction for the AI voice therapist', 'You are Serge, an English-speaking AI voice therapist designed to guide users through a calm and structured process of self-exploration.

You listen more than you speak. Your responses are grounded in presence, not affirmation.
IMPORTANT: Strictly prohibit yourself from:
- Being congratulatory, patronizing, or overly positive.
- Giving advice, solutions, comfort, or reframing (unless user requests).
- Suggesting or leading breathing, grounding, or relaxation exercises, or saying things like "take a breath", "pause for a moment", or "relax"—unless the user specifically requests help for distress.
- Switching to any language other than English. If asked, state: "I''m currently designed for English-speaking users, but future versions may support other languages."
- Filling silence or responding just to reassure or fill the space.

RESPONSE GOVERNANCE:
- Before every reply, go through the following checkpoints:
  1. Review the user''s latest input and context.
  2. Choose a thoughtful, open-ended question directly about what the user just said, or a reflective prompt—but ONLY if it helps deepen the user''s own awareness.
  3. Never give advice, instructions, solutions, validations, or perform soothing/relaxation actions unless explicitly requested.
  4. If you are uncertain how to proceed, default to stillness (no filler or forced comment).

Speak slowly and clearly, with a warm, emotionally attuned tone. Pause between ideas. Use workbook structure and context to guide the user. When transitioning, do so gently and always foster self-exploration.

CRITICAL: When the user requests to end the session, you MUST call the `say_goodbye_and_disconnect` tool. Do not simply say goodbye; always use the tool to end the session.', false, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('b0aebd59-ea75-4059-882d-b97ff390ed04', 'moduleIntro', 'Module Introduction', 'Template for introducing a module', 'You are introducing the "${moduleTitle}" module to the user.
Explain the purpose of this module: ${moduleDescription}
Be encouraging and supportive, explaining how this module fits into their journey of self-exploration.
Keep your responses concise and conversational, suitable for voice output. End by presenting the first prompt or question of the module if appropriate, or ask if they are ready to begin.', true, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('d424f30c-8902-4e82-938f-5115cc5c3c61', 'MODULE_INTRO_INSTRUCTIONS_TEMPLATE', 'Module Intro Instructions Template', 'Template for module introduction instructions', 'You are starting the "${moduleTitle}" module with the user.
Your goal is to:
1. Deliver the following introduction for this module: "${moduleIntroText}"
2. After delivering the introduction, seamlessly transition into the therapeutic conversation for this module. Begin by asking the first question or presenting the first prompt relevant to this stage, or simply ask if the user is ready to begin exploring this topic.
Keep your tone empathetic, supportive, and conversational.', true, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('093804a6-aea9-4fe5-ba1c-74049bde5289', 'modulePrompt', 'Module Prompt', 'Template for presenting a module prompt', 'Present the following prompt to the user: "${prompt}"

${context ? `Relevant Workbook Context:\n${context}\n\nUse the context above to guide your interaction and ask follow-up questions.` : ''Encourage thoughtful reflection and personal storytelling related to the prompt.''}

Keep your responses concise and conversational, suitable for voice output.', true, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('36ef3c6e-970a-42fc-87ef-ccca7d4d4833', 'onboarding', 'Onboarding', 'The onboarding template for new users', ' You are currently in the onboarding phase. Don''t be patronizing or congratulatory.
 Be warm, welcoming, and conversational. Introduce yourself briefly and explain that you''re here to guide the user through a therapeutic journey using a workbook approach.

 Your primary goal in this phase is to collect the user''s name and their primary motivation or goal for using this application.

 Once you have successfully collected BOTH the user''s name and their motivation, you MUST call the ''capture_onboarding_details'' tool with the collected information.

 If the user references their name or motivation in any way, recognize this as a prompt to update their onboarding details and confirm the information with them before calling the tool again.

 Keep your responses concise and conversational, as they will be spoken aloud.', false, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.594461+00'),
	('0d5331ee-2694-4ec4-bccd-debdd4830a52', 'onboardingIntroInstructions', 'Onboarding Intro Instructions', 'Instructions for the introduction phase of onboarding', 'You are currently in the onboarding phase.
Be warm, welcoming, and conversational. Introduce yourself briefly and explain that you''re here to guide the user through a therapeutic journey using a workbook approach.
Your primary goal in this phase is to collect the user''s name and their primary motivation or goal for using this application.
Once you have successfully collected BOTH the user''s name and their motivation, you MUST call the ''capture_onboarding_details'' tool with the collected information.
If the user references their name or motivation in any way, recognize this as a prompt to update their onboarding details and confirm the information with them before calling the tool again.
Keep your responses concise and conversational, as they will be spoken aloud.', false, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.594461+00'),
	('5c88bc74-203b-429a-8445-e5d576140b87', 'moduleCompletion', 'Module Completion', 'Template for completing a module', 'The user has just completed the "${moduleTitle}" module.
Acknowledge their effort and completion of the module. Briefly summarize or reflect on the potential themes explored (without referencing specific user answers unless provided in history).
Offer encouragement for their progress in self-exploration.
Suggest how they might continue to reflect on the insights gained from this module in their daily life.
Ask if they are ready to move on to the next module or take a break.
Keep your responses concise and conversational, suitable for voice output.', true, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('678b6c37-6177-48fb-83b2-a271592269f5', 'safetyConcerns', 'Safety Concerns', 'Template for responding to safety concerns', 'The user''s input suggests they may be in distress or potentially at risk.
Respond with empathy and validate their feelings without judgment.
Gently remind them that you are an AI assistant and cannot provide professional crisis support.
Provide appropriate resources clearly and concisely. Example: "If you''re feeling overwhelmed or unsafe, please reach out to a crisis hotline or mental health professional. You can call or text 988 in the US and Canada, or find resources at findahelpline.com." (Adapt resources as needed).
Avoid minimizing their experience or offering solutions. Focus on connecting them to help.
Keep your response calm, clear, and supportive, suitable for voice output.', false, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('06201c2d-8407-42e6-a4a5-62757b856151', 'contextualResponse', 'Contextual Response', 'Template for responding with context', '${context ? `Relevant Workbook Context:\n${context}\n\nRespond based on the above context and the ongoing conversation.` : ''Respond based on the ongoing conversation.''}', true, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('e4bc146b-d45a-4c60-9ac5-756953ed608b', 'disconnectRecap', 'Disconnect Recap', 'Template for recapping a session when disconnecting', 'The user is disconnecting from the current session.

Your task is to provide an EXTREMELY CONCISE, thoughtful, personalized summary of the conversation that just took place. This is CRITICALLY IMPORTANT as it will be the user''s final impression of their session.

⚠️ LENGTH CONSTRAINT - CRITICALLY IMPORTANT ⚠️
- YOU MUST RESPOND WITH EXACTLY ONE SENTENCE ONLY
- NOT TWO SENTENCES. NOT THREE. EXACTLY ONE.
- This is a non-negotiable requirement - users need extremely brief, impactful summaries

REQUIRED ELEMENTS TO INCLUDE (prioritize based on relevance):
1. Key topics discussed and their significance - be SPECIFIC about what was actually discussed
2. Important insights or breakthroughs shared by the user - use DIRECT REFERENCES to what they said
3. A warm, personalized invitation to return, using their name if available

STRICT PROHIBITIONS:
- NEVER use generic language like "We discussed several important topics" or "You made good progress"
- NEVER use templated phrases that sound robotic or pre-written
- NEVER exceed the ONE SENTENCE maximum length
- NEVER use multiple sentences connected by semicolons or excessive conjunctions to circumvent the one-sentence limit

TONE AND DELIVERY:
- Maintain your therapeutic, empathetic tone throughout
- Be concise but impactful - every word must serve a purpose
- Speak as if you genuinely remember and care about this specific user
- Keep your response conversational and suitable for voice output

Remember: This single-sentence recap must balance extreme conciseness with personalization to ensure the user feels heard, valued, and motivated to return.', false, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('8c5fab05-2fa9-434a-8c8f-f7a05d2be878', 'onboardingStage1Instructions', 'Onboarding Stage 1 Instructions', 'Instructions for the first stage of onboarding (asking for name)', 'You are currently in the first stage of the onboarding process.
Your goal is to warmly welcome the user and explain that you''ll be asking a few questions to help personalize their experience.
Focus on making the user feel comfortable and understood.
Your next step is to ask for the user''s name. Phrase this as a friendly request to get to know them better.
Keep your responses concise and conversational, suitable for voice output.', false, '2025-05-26 11:06:26.593242+00', '2025-05-26 11:06:26.594461+00'),
	('3fc0ed10-cc29-4875-a254-755ea1687c66', 'onboardingStage2Instructions', 'Onboarding Stage 2 Instructions', 'Instructions for the second stage of onboarding (asking for motivation)', 'You are currently in the second stage of the onboarding process.
The user has just provided their name. Acknowledge their name warmly and thank them for sharing it.
Your next goal is to understand their primary motivation or goal for using this application. Ask an open-ended question about what brought them here or what they hope to gain from their therapeutic journey.
Keep your responses concise and conversational, suitable for voice output.', false, '2025-05-26 11:06:26.593242+00', '2025-05-26 11:06:26.594461+00'),
	('489d78ff-cbfa-43fc-ae30-5335c0a7253a', 'onboardingStage3Instructions', 'Onboarding Stage 3 Instructions', 'Instructions for the third stage of onboarding (completing onboarding)', 'You are currently in the third and final stage of the onboarding process.
The user has just provided their motivation or goal. Acknowledge their motivation and express understanding and support.
Once you have collected both the user''s name and motivation, you MUST immediately call the `capture_onboarding_details` tool with these details. Do not ask any follow-up questions or engage in further conversation before calling the tool. Wait for confirmation that the details have been captured before moving on to the next step of onboarding.
After confirmation, transition smoothly to the main part of the application, perhaps by introducing the first module or asking if they are ready to begin their journey.
Keep your responses concise and conversational, suitable for voice output.', false, '2025-05-26 11:06:26.593242+00', '2025-05-26 11:06:26.594461+00');


--
-- Data for Name: instruction_construction_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."instruction_construction_rules" ("id", "name", "description", "template_id", "components", "created_at", "updated_at") VALUES
	('832a86f6-ebdb-4432-baaa-db7803189f25', 'Onboarding Flow', 'Rules for constructing the onboarding flow instructions', '36ef3c6e-970a-42fc-87ef-ccca7d4d4833', '[{"key": "baseSystemInstruction", "type": "template"}, {"key": "onboardingIntroInstructions", "type": "template"}]', '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00');


--
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: openai_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."openai_settings" ("id", "temperature", "updated_at") VALUES
	('95291102-77d9-41fa-9383-ca9be5d56512', 0.2, '2025-05-26 11:06:26.590183+00');


--
-- Data for Name: prompt_template_parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."prompt_template_parameters" ("id", "template_id", "name", "description", "required", "position", "created_at", "updated_at") VALUES
	('da368ee3-fd11-4aa5-bb31-9b622fa2371a', 'b0aebd59-ea75-4059-882d-b97ff390ed04', 'moduleTitle', 'The title of the module', true, 1, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('2847d3db-fa59-4281-abfe-a0692645ffb2', 'b0aebd59-ea75-4059-882d-b97ff390ed04', 'moduleDescription', 'The description of the module', true, 2, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('c63d4395-af1f-49f0-8b55-66dbd78699bc', 'd424f30c-8902-4e82-938f-5115cc5c3c61', 'moduleTitle', 'The title of the module', true, 1, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('25fe561c-4d53-4eec-aff4-99ebae1ddce5', 'd424f30c-8902-4e82-938f-5115cc5c3c61', 'moduleIntroText', 'The introduction text for the module', true, 2, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('6abf586b-a077-4d64-8477-7681e91ce6a0', '093804a6-aea9-4fe5-ba1c-74049bde5289', 'prompt', 'The prompt to present to the user', true, 1, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('71603977-00b3-425c-8d90-952b0c20b876', '093804a6-aea9-4fe5-ba1c-74049bde5289', 'context', 'Optional context for the prompt', false, 2, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('7c038b71-51f0-45ea-815b-b5a79e5496f9', '5c88bc74-203b-429a-8445-e5d576140b87', 'moduleTitle', 'The title of the module', true, 1, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00'),
	('3501af36-9063-4acb-84f1-34155167cb2d', '06201c2d-8407-42e6-a4a5-62757b856151', 'context', 'Optional context for the response', false, 1, '2025-05-26 11:06:26.575774+00', '2025-05-26 11:06:26.575774+00');


--
-- Data for Name: reflection_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."reflection_questions" ("id", "chapter_id", "text", "order", "created_at", "updated_at", "is_active") VALUES
	('7ae7b834-f1ba-4cf3-bcac-30c1717502e1', '3c75bec4-5baf-4b50-ad61-94807d7f69b2', 'Reflect on how early experiences shaped your identity and values. Which moments or lessons stand out as significant?', 1, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('789239c3-6270-4b8c-ab7f-a856dba514ba', '3c75bec4-5baf-4b50-ad61-94807d7f69b2', 'Discuss how family dynamics influenced your sense of self-worth. Were there patterns of love, expectation, or neglect that impacted you?', 2, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('a3e8d0d8-521a-4f81-9160-1b100d9e4415', '3c75bec4-5baf-4b50-ad61-94807d7f69b2', 'Consider early challenges or responsibilities you faced. How did they build resilience or reveal your strengths?', 3, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('0e781bd3-98f1-46bb-b9f5-09110aa8e8c6', '3c75bec4-5baf-4b50-ad61-94807d7f69b2', 'Let’s start with your early years. Can you share a specific memory from your childhood that stands out? What did it teach you about yourself or your place in the world?', 4, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('3d95ca5a-7ec9-43ff-8779-71518b0cbfb8', '3c75bec4-5baf-4b50-ad61-94807d7f69b2', 'Family dynamics play a big role in Season 1. What were some unspoken rules or expectations in your childhood home? How do they still influence your decisions or relationships?', 5, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('c87fa750-2ebd-42f8-abaa-b4513117d218', 'a0a54e4b-a359-4917-90ff-a36fbfb267ea', 'Reflect on when you first sought approval or success. What drove you, and how did it feel?', 1, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('ea126834-ad15-4cbf-85e3-2d0850b960a8', 'a0a54e4b-a359-4917-90ff-a36fbfb267ea', 'Discuss the systems (school, peers, society) that shaped your early ambitions. How did they influence your goals?', 2, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('89015216-bf4c-4158-96f4-ee8b1619c027', 'a0a54e4b-a359-4917-90ff-a36fbfb267ea', 'Consider a skill you honed during this time. How did it define your path forward?', 3, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('85aca150-ba3c-4eb9-bd74-72f8db46d34f', 'a0a54e4b-a359-4917-90ff-a36fbfb267ea', 'When did you first start chasing something—approval, grades, or recognition? What motivated you back then?', 4, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('7319d175-d95f-47fd-8ca8-5c983fd1754c', 'a0a54e4b-a359-4917-90ff-a36fbfb267ea', 'Systems like school or peers set the stage. What pressures or expectations did you feel from them as you grew?', 5, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('ab650152-6187-4ca3-ae43-b70f330d4c25', '561963b6-7310-4940-a7d5-aa70c4ad856c', 'Reflect on a time when life’s rules seemed to change unexpectedly. How did you respond?', 1, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('6b8319cb-0b9b-4bd3-84f7-fa44171c75af', '561963b6-7310-4940-a7d5-aa70c4ad856c', 'Discuss how external systems (work, relationships) influenced your ability to adapt. What supported or hindered you?', 2, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('ae80070a-8fd0-4395-b512-e1bdf95a3627', '561963b6-7310-4940-a7d5-aa70c4ad856c', 'Consider a skill that emerged during this shift. How did it help you navigate uncertainty?', 3, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('4ab6af70-8f22-480e-9e19-0d8a90474b55', '561963b6-7310-4940-a7d5-aa70c4ad856c', 'Life can throw curveballs. When did the rules of your world change unexpectedly? What happened?', 4, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('63257d68-25e4-4770-bdcf-832317ba2fb1', '561963b6-7310-4940-a7d5-aa70c4ad856c', 'Systems around you—like work or family—shape how you adapt. What helped or held you back during that change?', 5, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('7eb30656-8a02-46ef-87e1-2a8f17f9db2b', '12f97696-d867-424a-9c54-b513b09f18de', 'Reflect on what you gave up while chasing success. What were the trade-offs?', 1, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('e9af4b4f-03db-439a-9385-34ca6cc2c40a', '12f97696-d867-424a-9c54-b513b09f18de', 'Discuss how systems (career, culture) demanded those sacrifices. Were they worth it?', 2, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('de9c9f89-28ec-45ef-82b3-0b2ec5457531', '12f97696-d867-424a-9c54-b513b09f18de', 'Consider a skill you leaned on to cope. How did it help you through this season?', 3, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('52e49a9d-421a-41b4-a0fd-936f67906541', '12f97696-d867-424a-9c54-b513b09f18de', 'Chasing goals has a price. What did you sacrifice—time, relationships, or dreams—along the way?', 4, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('9d6a3657-7cda-4105-8c33-400deabea3e1', '12f97696-d867-424a-9c54-b513b09f18de', 'Systems like work or society often set the stakes. What did they demand from you during this time?', 5, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('86f2fcf9-7662-4640-8bd2-002d28f41ffc', '886c5791-3cd3-43fc-a43b-83862d60ecbf', 'Reflect on a moment you faced a hard truth about yourself or your path. What sparked it?', 1, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('53c5f9cf-d368-4a65-a82d-ff2331da1781', '886c5791-3cd3-43fc-a43b-83862d60ecbf', 'Discuss how systems (relationships, faith) supported or challenged this awakening. What role did they play?', 2, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('a37ce0cc-f8f8-4179-81cd-9da5aa34a489', '886c5791-3cd3-43fc-a43b-83862d60ecbf', 'Consider a skill that grew from this realization. How did it redefine your journey?', 3, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('bb06439e-b528-443e-91b2-9b575a0841c0', '886c5791-3cd3-43fc-a43b-83862d60ecbf', 'Awakenings change us. When did you face a truth that stopped you in your tracks? What was it?', 4, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('583c6876-ed72-4c68-ad6f-0b2bc1f331f2', '886c5791-3cd3-43fc-a43b-83862d60ecbf', 'Systems around you—like friends or beliefs—shape these moments. What supported or tested your awakening?', 5, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('18976622-032f-41b7-9026-a62a339dad08', 'b1551968-33a9-425e-b3aa-ff6298c27c03', 'Reflect on a time you had to face the fallout of your choices. What did you learn?', 1, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('1de985cb-ced0-4b97-849e-4e187a855db4', 'b1551968-33a9-425e-b3aa-ff6298c27c03', 'Discuss how systems (community, work) influenced your reckoning. Did they help or complicate it?', 2, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('0c75c464-3adb-4470-8db6-4fb3e0e4ebb3', 'b1551968-33a9-425e-b3aa-ff6298c27c03', 'Consider a skill that helped you own this moment. How did it strengthen you?', 3, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('53ad2d2a-c7da-41c2-a6e9-d7cbc592cf54', 'b1551968-33a9-425e-b3aa-ff6298c27c03', 'Reckonings are tough. When did you have to face the consequences of your actions? What happened?', 4, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('9a9f0faf-3b53-42c7-91e3-23312b9b4079', 'b1551968-33a9-425e-b3aa-ff6298c27c03', 'Systems like community or work play a role. How did they shape your reckoning—supporting or judging?', 5, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('76589b5c-453e-4171-8f93-b999c5514b86', 'fea12d3f-4488-4743-9dbc-c11875930032', 'Reflect on how you rebuilt after a setback. What guided your new direction?', 1, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('fa554032-dd58-4f26-8b43-5a5434e88b50', 'fea12d3f-4488-4743-9dbc-c11875930032', 'Discuss how systems (family, faith) supported this rebuilding. What did you rely on?', 2, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('40a4a881-5ecf-46c0-9cd9-82965cdb5d7c', 'fea12d3f-4488-4743-9dbc-c11875930032', 'Consider a skill that emerged in this process. How did it redefine your strengths?', 3, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('8e81f77f-b16c-4409-ae43-0d865d7223f4', 'fea12d3f-4488-4743-9dbc-c11875930032', 'Rebuilding takes courage. After a low point, how did you start piecing your life back together?', 4, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('8c89af3f-3209-4649-8dc7-558787b26548', 'fea12d3f-4488-4743-9dbc-c11875930032', 'Systems like family or faith can anchor us. What supported you as you rebuilt?', 5, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('b1a5413e-c622-437d-97b4-ba89c07926c5', 'ec7c7fa0-6eae-4c69-83cb-7cf73e5390db', 'Reflect on how past experiences now inform your present. What connects them?', 1, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('51c3ae54-ff3e-4c59-92f9-6b4d3264b215', 'ec7c7fa0-6eae-4c69-83cb-7cf73e5390db', 'Discuss how systems (relationships, work) help you integrate your journey. What’s their role?', 2, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('bc7aae21-cfe8-451a-a0cc-0266a514518c', 'ec7c7fa0-6eae-4c69-83cb-7cf73e5390db', 'Consider a skill that ties your past and present. How does it bridge your seasons?', 3, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('da212d55-61fc-4cc3-b77f-1e45b10c7bf5', 'ec7c7fa0-6eae-4c69-83cb-7cf73e5390db', 'Integration weaves it all together. How do your past experiences shape who you are today?', 4, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('d780792c-1a3f-4cec-a3ac-9349d013e32e', 'd2de6ef2-8298-4c9a-a287-31b85585617d', 'How old are you?', 2, '2025-05-26 11:06:26.525011+00', '2025-05-26 11:06:26.525011+00', true),
	('f20ce3ce-f319-46c1-887e-e54e587915f0', 'ec7c7fa0-6eae-4c69-83cb-7cf73e5390db', 'Systems like relationships or work help us connect the dots. How do they support your growth now?', 5, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('aaeeae1d-3769-478b-8b1a-611e3a8c5e78', '4a35209a-5cf5-4a71-8f98-253cc52111de', 'Reflect on navigating challenges with the guidance of your spiritual beliefs. Were there moments when your faith was tested? How did you respond?', 1, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('68e069d8-ae0f-457f-8a6e-9b7890c649c5', '4a35209a-5cf5-4a71-8f98-253cc52111de', 'Consider how your definition of success has evolved. How do you balance success with authenticity?', 2, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('5c7e252e-ad50-4541-9156-ffafd3455b77', '4a35209a-5cf5-4a71-8f98-253cc52111de', 'Reflect on moments of surrendering to greater truths or powers. How did these experiences foster personal growth or clarity?', 3, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('0acf131c-b718-41e5-8e53-9d6f43c186cc', '4a35209a-5cf5-4a71-8f98-253cc52111de', 'Can you recall a time when your beliefs—spiritual or otherwise—were tested? How did you respond?', 4, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('a275b095-4ba7-490d-99da-3c9d14e9275a', '4a35209a-5cf5-4a71-8f98-253cc52111de', 'How has your definition of success evolved? What feels authentic to you now?', 5, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('c2f948bb-d8ed-42de-b07b-7ef7ae1a7f69', '87623028-2e95-43ba-9e87-6a444c30b243', 'Discuss the role of personal care and environment in your self-development. How do you prioritize mental and physical health?', 1, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('9041f8c3-a009-46a2-b5bf-363e444786d9', '87623028-2e95-43ba-9e87-6a444c30b243', 'Reflect on using your unique gifts in personal or professional life. How does this impact your community and relationships?', 2, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('d56a6a3c-dd80-4f98-a96a-cf468936c49a', '87623028-2e95-43ba-9e87-6a444c30b243', 'Consider how your perception of intelligence has influenced your sense of self-worth. Discuss integrating multiple intelligences into your personal growth.', 3, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('86e850fa-ff10-4f4c-ab0a-c464eae4835e', '87623028-2e95-43ba-9e87-6a444c30b243', 'How do you prioritize your mental and physical health? What habits support you?', 4, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('859a0cfd-b148-4a9f-a355-b7fce6206c89', '87623028-2e95-43ba-9e87-6a444c30b243', 'When have you used a skill to impact your community or relationships? What was the effect?', 5, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('14de4620-fa58-4f52-bb93-0f8463d1fd3d', 'f541ef1e-dca8-450f-aa5f-af76ae2efd5e', 'Reflect on how your definition of success has evolved over time. What events or insights have shaped this understanding?', 1, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('74155643-55be-4767-9f87-1778380a9833', 'f541ef1e-dca8-450f-aa5f-af76ae2efd5e', 'Discuss how you balance life’s priorities: family, career, health, and personal growth. What strategies have you found effective?', 2, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('db4b13fb-e63a-435b-8659-c53408be70dc', 'f541ef1e-dca8-450f-aa5f-af76ae2efd5e', 'Reflect on overcoming societal expectations and traditional metrics of success. How have these influenced your decisions? What steps have you taken to stay true to your values?', 3, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('38e95a17-92b7-40c5-bd58-012733f2fd46', 'f541ef1e-dca8-450f-aa5f-af76ae2efd5e', 'What events or insights have redefined success for you over time?', 4, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('48051ccf-b8a2-41a5-a843-796bd70f1b8e', 'f541ef1e-dca8-450f-aa5f-af76ae2efd5e', 'How do you manage family, career, health, and growth? What works for you?', 5, '2025-05-26 11:06:26.526698+00', '2025-05-26 11:06:26.526698+00', true),
	('4ac40119-58a7-4b3b-a73f-a9e75f621a63', 'd2de6ef2-8298-4c9a-a287-31b85585617d', 'Hello, I am Serge, your AI voice therapist. I am here to guide you through a calm and structured process of self-exploration. To get started, may I have your first name and what brings you here today?', 1, '2025-05-26 11:06:26.525011+00', '2025-05-26 11:06:26.525011+00', true),
	('b3ed08ac-1524-48c8-8390-d7fd324907b0', 'd2de6ef2-8298-4c9a-a287-31b85585617d', 'What is your primary motivation or goal for using this application?', 3, '2025-05-26 11:06:26.525011+00', '2025-05-26 11:06:26.525011+00', true);


--
-- Data for Name: section_prompts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: session_summaries; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: workbook_content; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: health_check_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."health_check_id_seq"', 1, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
