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
-- Data for Name: workbook_chapters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."workbook_chapters" ("id", "number", "title", "theme", "created_at", "updated_at", "is_active", "order", "slug") VALUES
	('4eba0f8c-0973-4108-b150-525d95c3bf87', 0, 'Onboarding', 'onboarding', '2025-05-23 11:08:08.091169+00', '2025-05-23 11:08:08.091169+00', true, 0, 'onboarding'),
	('9e17df90-60e3-4d3d-8a01-68f0ec53304a', 1, 'The Basics', 'Early experiences shaping identity and worth', '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true, 1, 'the-basics'),
	('f2fa406a-2b3a-4152-ac76-fc14dfa4fee6', 2, 'The Game Begins', 'Entering the pursuit of success and external validation', '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true, 2, 'the-game-begins'),
	('7167242f-bb64-4268-880f-bc414ac08b15', 3, 'The Rules Change', 'Facing unexpected shifts and adapting to new realities', '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true, 3, 'the-rules-change'),
	('a3297435-a0c0-463a-9541-4b28fe0e9162', 4, 'The Cost of the Game', 'Recognizing the sacrifices made in pursuit of achievement', '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true, 4, 'the-cost-of-the-game'),
	('1adbfa61-ad28-413a-89b0-3d4bdde936a5', 5, 'The Awakening', 'Encountering a moment of truth or self-realization', '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true, 5, 'the-awakening'),
	('a126fe1e-9158-45d6-af11-18b9550da225', 6, 'The Reckoning', 'Confronting consequences and taking responsibility', '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true, 6, 'the-reckoning'),
	('5af4d3b1-3023-43de-b184-e799c30e97f5', 7, 'The Rebuild', 'Reconstructing life with new priorities and purpose', '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true, 7, 'the-rebuild'),
	('5fa3ff92-6381-41ae-b0cd-dfcb720f6a71', 8, 'The Integration', 'Connecting past lessons to present growth', '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true, 8, 'the-integration'),
	('57b75f86-03b9-4435-903a-caf84cbc42af', 9, 'The Journey All Along', 'Integrating life’s seasons through spiritual awareness and purpose', '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true, 9, 'the-journey-all-along'),
	('1a8a0059-8b89-49a3-8cd4-1eb9715a9657', 10, 'A Journey That Makes Sense', 'Using intellect and environment for personal growth', '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true, 10, 'a-journey-that-makes-sense'),
	('649930bf-2cd0-4b5a-935c-7181db298065', 11, 'A Journey to Wholeness', 'Redefining success and integrating life’s aspects', '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true, 11, 'a-journey-to-wholeness');


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
	('f3b7ec31-502c-46e5-a01e-61ffda242c1f', 'John', 35, 'I want to understand myself better and improve my relationships', true, '2025-05-22 11:08:08.112124+00', '[{"id": "early_life", "status": "completed", "progress": 1.0}, {"id": "relationships", "status": "in_progress", "progress": 0.5}]', '4eba0f8c-0973-4108-b150-525d95c3bf87', NULL, 'f934c5d0-ae91-4e78-9de2-4855f68e9124', '{f934c5d0-ae91-4e78-9de2-4855f68e9124,3defb362-b45a-481b-9ee6-cd82377230a7}', '{"season1_complete": true, "season2_complete": false, "season3_complete": false, "season4_complete": false}', 5, '4eba0f8c-0973-4108-b150-525d95c3bf87', 'John reflected on his childhood experiences, noting how his parents'' divorce affected his trust in relationships. He identified patterns of seeking approval and avoiding conflict that originated in his early family dynamics.', 'Session focused on early life experiences and their impact on current relationship patterns. John showed insight into how childhood events shaped his adult behaviors.', NULL, NULL),
	('2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b', 'John', 35, 'I want to understand myself better and improve my relationships', true, '2025-05-20 11:08:08.112124+00', '[{"id": "early_life", "status": "completed", "progress": 1.0}, {"id": "relationships", "status": "not_started", "progress": 0.0}]', '9e17df90-60e3-4d3d-8a01-68f0ec53304a', NULL, '451238bc-37a0-4c71-a6b6-d79ff5923702', '{f934c5d0-ae91-4e78-9de2-4855f68e9124}', '{"season1_complete": true, "season2_complete": false, "season3_complete": false, "season4_complete": false}', 5, '9e17df90-60e3-4d3d-8a01-68f0ec53304a', 'John discussed challenges he faced as a teenager, including academic pressure and social anxiety. He recognized how these experiences helped him develop resilience and problem-solving skills.', 'Session explored formative challenges and their contribution to personal growth. John identified both positive and negative coping mechanisms developed during this period.', NULL, NULL),
	('3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f', 'John', 35, 'I want to understand myself better and improve my relationships', true, '2025-05-17 11:08:08.112124+00', '[{"id": "early_life", "status": "in_progress", "progress": 0.7}]', 'f2fa406a-2b3a-4152-ac76-fc14dfa4fee6', NULL, '0ac662c3-e1d4-437b-93c4-12a74a8b0e8c', '{}', '{"season1_complete": false, "season2_complete": false, "season3_complete": false, "season4_complete": false}', 5, 'f2fa406a-2b3a-4152-ac76-fc14dfa4fee6', 'John shared memories of his first day at school and how it shaped his approach to new situations. He noted patterns of initial hesitation followed by adaptation that continue in his adult life.', 'Initial exploration of early memories and their lasting impact. John began connecting childhood experiences to current behavioral patterns.', NULL, NULL);


--
-- Data for Name: conversation_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."conversation_messages" ("id", "session_id", "timestamp", "role", "content") VALUES
	('57dd6a71-6f36-4f02-91a2-f7dcd925e5e6', 'f3b7ec31-502c-46e5-a01e-61ffda242c1f', '2025-05-22 09:08:08.112124+00', 'assistant', 'Reflect on how early experiences shaped your identity and values. Which moments or lessons stand out as significant?'),
	('582d74a6-4a77-4e98-8a2f-752c54ddac72', 'f3b7ec31-502c-46e5-a01e-61ffda242c1f', '2025-05-22 09:13:08.112124+00', 'user', 'My parents'' divorce when I was 10 really shaped me. I learned that relationships can be fragile, which made me cautious about trusting others completely. On the positive side, my grandmother taught me the value of persistence - she always said "steady wins the race" and showed me how consistent effort pays off.'),
	('75225d4d-8374-4e7f-b6ce-f1a702985065', 'f3b7ec31-502c-46e5-a01e-61ffda242c1f', '2025-05-22 09:18:08.112124+00', 'assistant', 'Thank you for sharing that, John. The experience of your parents'' divorce clearly had a profound impact on how you approach trust in relationships. It''s common for children of divorce to develop a certain caution or hesitancy in their own relationships. At the same time, your grandmother provided an important counterbalance with her wisdom about persistence. How do you think these two influences - the caution from witnessing your parents'' relationship end, and the value of persistence from your grandmother - play out in your life today?'),
	('f66ac9e9-0f0f-4546-9557-950c853dfaf1', 'f3b7ec31-502c-46e5-a01e-61ffda242c1f', '2025-05-22 09:23:08.112124+00', 'user', 'I think they''re constantly in tension. In relationships, I''m always looking for signs that things might fall apart, which sometimes makes me pull back when I should be leaning in. But my grandmother''s influence helps me stick with things even when they get difficult. I''ve stayed in my current job for 8 years, even through tough periods, and I''m proud of that persistence. I''m trying to bring more of that steadiness to my personal relationships too.'),
	('652a04fc-55e8-4864-bb7a-f4b8d10e2353', '2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b', '2025-05-20 08:08:08.112124+00', 'assistant', 'Consider early challenges or responsibilities you faced. How did they build resilience or reveal your strengths?'),
	('9c433f1a-dd7c-4649-9be6-43f333fd58ee', '2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b', '2025-05-20 08:13:08.112124+00', 'user', 'In high school, I struggled with social anxiety while also facing pressure to excel academically. I developed a system of preparing extensively for any social situation or test, which helped me manage my anxiety. This revealed my strength in planning and preparation, but also my tendency to overthink things. I also became the person friends would come to with problems, which showed me I had a natural ability to listen and provide perspective.'),
	('656aea20-99b0-4bfd-a59f-fc27629418a9', '2a7b9c45-d8e3-4f12-b6a7-9c8d7e5f4a3b', '2025-05-20 08:18:08.112124+00', 'assistant', 'You''ve identified some important patterns there, John. Your response to anxiety through preparation has become a double-edged sword - providing you with a valuable skill in planning and organization, while sometimes leading to overthinking. And it''s interesting how you became a confidant for friends, developing listening skills even while managing your own social anxiety. These early adaptations often become lifelong patterns. How do you see these strengths and tendencies showing up in your current life? Are there situations where your preparation serves you well, and others where it might hold you back?'),
	('6cd5361b-8684-4708-b83e-252cd86b9355', '3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f', '2025-05-17 10:08:08.112124+00', 'assistant', 'Let''s start with your early years. Can you share a specific memory from your childhood that stands out? What did it teach you about yourself or your place in the world?'),
	('21c7d1a0-14e8-494d-b88c-0f9c9b1d0011', '3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f', '2025-05-17 10:13:08.112124+00', 'user', 'I remember my first day of kindergarten vividly. I was terrified and clung to my mom''s leg, refusing to go in. The teacher had to gently pry me away. But by lunchtime, I was playing with other kids and didn''t want to leave when my mom came to pick me up. I think this taught me that I''m initially resistant to new situations but can adapt quickly once I give them a chance. This pattern has repeated throughout my life - new jobs, moving to new cities, meeting new people. I always dread the change but end up embracing it.'),
	('f4241214-224c-4916-98a4-a70543553aa4', '3c8d7e6f-5a4b-3c2d-1e9f-8a7b6c5d4e3f', '2025-05-17 10:18:08.112124+00', 'assistant', 'That''s a powerful insight, John. This pattern of initial resistance followed by adaptation has been consistent throughout your life. It shows both your natural caution and your underlying flexibility and resilience. Many people struggle with transitions their entire lives, but you''ve recognized your pattern: the initial fear followed by successful adaptation. This self-awareness is valuable. When you face new situations now, does recognizing this pattern help you move through the initial resistance more easily? Or do you still experience that same intensity of dread despite knowing you''ll likely adapt well?');


--
-- Data for Name: health_check; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."health_check" ("id", "status", "checked_at") VALUES
	(1, 'ok', '2025-05-23 11:08:07.987201+00');


--
-- Data for Name: prompt_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."prompt_templates" ("id", "key", "name", "description", "content", "is_function", "created_at", "updated_at") VALUES
	('87764538-e1bb-478c-940e-cab9894cd0b2', 'baseSystemInstruction', 'Base System Instruction', 'The base system instruction for the AI voice therapist', 'You are Serge, an English-speaking AI voice therapist designed to guide users through a calm and structured process of self-exploration.

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

CRITICAL: When the user requests to end the session, you MUST call the `say_goodbye_and_disconnect` tool. Do not simply say goodbye; always use the tool to end the session.', false, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('adabbd23-fecb-482b-9128-5a92c8f6c190', 'moduleIntro', 'Module Introduction', 'Template for introducing a module', 'You are introducing the "${moduleTitle}" module to the user.
Explain the purpose of this module: ${moduleDescription}
Be encouraging and supportive, explaining how this module fits into their journey of self-exploration.
Keep your responses concise and conversational, suitable for voice output. End by presenting the first prompt or question of the module if appropriate, or ask if they are ready to begin.', true, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('4b55c71c-3b57-40ed-b588-03be341f622f', 'MODULE_INTRO_INSTRUCTIONS_TEMPLATE', 'Module Intro Instructions Template', 'Template for module introduction instructions', 'You are starting the "${moduleTitle}" module with the user.
Your goal is to:
1. Deliver the following introduction for this module: "${moduleIntroText}"
2. After delivering the introduction, seamlessly transition into the therapeutic conversation for this module. Begin by asking the first question or presenting the first prompt relevant to this stage, or simply ask if the user is ready to begin exploring this topic.
Keep your tone empathetic, supportive, and conversational.', true, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('1c668f20-d0ff-46f7-ba36-89b199138961', 'modulePrompt', 'Module Prompt', 'Template for presenting a module prompt', 'Present the following prompt to the user: "${prompt}"

${context ? `Relevant Workbook Context:\n${context}\n\nUse the context above to guide your interaction and ask follow-up questions.` : ''Encourage thoughtful reflection and personal storytelling related to the prompt.''}

Keep your responses concise and conversational, suitable for voice output.', true, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('187cd67f-b4b7-41e7-8c0a-bb3dcaf17d76', 'moduleCompletion', 'Module Completion', 'Template for completing a module', 'The user has just completed the "${moduleTitle}" module.
Acknowledge their effort and completion of the module. Briefly summarize or reflect on the potential themes explored (without referencing specific user answers unless provided in history).
Offer encouragement for their progress in self-exploration.
Suggest how they might continue to reflect on the insights gained from this module in their daily life.
Ask if they are ready to move on to the next module or take a break.
Keep your responses concise and conversational, suitable for voice output.', true, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('e424bb33-4040-4df1-93e1-0abafca20e10', 'safetyConcerns', 'Safety Concerns', 'Template for responding to safety concerns', 'The user''s input suggests they may be in distress or potentially at risk.
Respond with empathy and validate their feelings without judgment.
Gently remind them that you are an AI assistant and cannot provide professional crisis support.
Provide appropriate resources clearly and concisely. Example: "If you''re feeling overwhelmed or unsafe, please reach out to a crisis hotline or mental health professional. You can call or text 988 in the US and Canada, or find resources at findahelpline.com." (Adapt resources as needed).
Avoid minimizing their experience or offering solutions. Focus on connecting them to help.
Keep your response calm, clear, and supportive, suitable for voice output.', false, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('a4bf24ae-a288-4789-a01d-1c6b7b7e9d19', 'contextualResponse', 'Contextual Response', 'Template for responding with context', '${context ? `Relevant Workbook Context:\n${context}\n\nRespond based on the above context and the ongoing conversation.` : ''Respond based on the ongoing conversation.''}', true, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('67c6d015-03b3-4237-9255-1949e6aa8f8f', 'disconnectRecap', 'Disconnect Recap', 'Template for recapping a session when disconnecting', 'The user is disconnecting from the current session.

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

Remember: This single-sentence recap must balance extreme conciseness with personalization to ensure the user feels heard, valued, and motivated to return.', false, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('d9eb8f66-3fe2-42b6-b9cb-566f0ef45a95', 'onboarding', 'Onboarding', 'The onboarding template for new users', ' You are currently in the onboarding phase. Don''t be patronizing or congratulatory.
 Be warm, welcoming, and conversational. Introduce yourself briefly and explain that you''re here to guide the user through a therapeutic journey using a workbook approach.

 Your primary goal in this phase is to collect the user''s name and their primary motivation or goal for using this application.

 Once you have successfully collected BOTH the user''s name and their motivation, you MUST call the ''capture_onboarding_details'' tool with the collected information.

 If the user references their name or motivation in any way, recognize this as a prompt to update their onboarding details and confirm the information with them before calling the tool again.

 Keep your responses concise and conversational, as they will be spoken aloud.', false, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.160283+00'),
	('2520ca6e-aac8-43e3-ba66-2704f080cdb1', 'onboardingIntroInstructions', 'Onboarding Intro Instructions', 'Instructions for the introduction phase of onboarding', 'You are currently in the onboarding phase.
Be warm, welcoming, and conversational. Introduce yourself briefly and explain that you''re here to guide the user through a therapeutic journey using a workbook approach.
Your primary goal in this phase is to collect the user''s name and their primary motivation or goal for using this application.
Once you have successfully collected BOTH the user''s name and their motivation, you MUST call the ''capture_onboarding_details'' tool with the collected information.
If the user references their name or motivation in any way, recognize this as a prompt to update their onboarding details and confirm the information with them before calling the tool again.
Keep your responses concise and conversational, as they will be spoken aloud.', false, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.160283+00'),
	('02534f0a-eecd-4d3b-bab8-00403987b63d', 'onboardingStage1Instructions', 'Onboarding Stage 1 Instructions', 'Instructions for the first stage of onboarding (asking for name)', 'You are currently in the first stage of the onboarding process.
Your goal is to warmly welcome the user and explain that you''ll be asking a few questions to help personalize their experience.
Focus on making the user feel comfortable and understood.
Your next step is to ask for the user''s name. Phrase this as a friendly request to get to know them better.
Keep your responses concise and conversational, suitable for voice output.', false, '2025-05-23 11:08:08.159123+00', '2025-05-23 11:08:08.160283+00'),
	('b859a00d-58b0-4f01-8d22-c368a3b6dca9', 'onboardingStage2Instructions', 'Onboarding Stage 2 Instructions', 'Instructions for the second stage of onboarding (asking for motivation)', 'You are currently in the second stage of the onboarding process.
The user has just provided their name. Acknowledge their name warmly and thank them for sharing it.
Your next goal is to understand their primary motivation or goal for using this application. Ask an open-ended question about what brought them here or what they hope to gain from their therapeutic journey.
Keep your responses concise and conversational, suitable for voice output.', false, '2025-05-23 11:08:08.159123+00', '2025-05-23 11:08:08.160283+00'),
	('c88b6b81-d62d-4a63-8471-9cb6d33da1bb', 'onboardingStage3Instructions', 'Onboarding Stage 3 Instructions', 'Instructions for the third stage of onboarding (completing onboarding)', 'You are currently in the third and final stage of the onboarding process.
The user has just provided their motivation or goal. Acknowledge their motivation and express understanding and support.
Once you have collected both the user''s name and motivation, you MUST immediately call the `capture_onboarding_details` tool with these details. Do not ask any follow-up questions or engage in further conversation before calling the tool. Wait for confirmation that the details have been captured before moving on to the next step of onboarding.
After confirmation, transition smoothly to the main part of the application, perhaps by introducing the first module or asking if they are ready to begin their journey.
Keep your responses concise and conversational, suitable for voice output.', false, '2025-05-23 11:08:08.159123+00', '2025-05-23 11:08:08.160283+00');


--
-- Data for Name: instruction_construction_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."instruction_construction_rules" ("id", "name", "description", "template_id", "components", "created_at", "updated_at") VALUES
	('6e3921b1-067e-4ca2-a594-2ee093a15777', 'Onboarding Flow', 'Rules for constructing the onboarding flow instructions', 'd9eb8f66-3fe2-42b6-b9cb-566f0ef45a95', '[{"key": "baseSystemInstruction", "type": "template"}, {"key": "onboardingIntroInstructions", "type": "template"}]', '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00');


--
-- Data for Name: modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."modules" ("id", "title", "description", "display_order", "stage") VALUES
	('onboarding', 'Onboarding', 'Initial setup and introduction.', 0, 'Setup'),
	('early_life', 'Early Life Exploration', 'Explore your early childhood experiences and their impact on your development.', 1, 'The Basics'),
	('adolescence', 'Adolescence & Identity', 'Reflect on your teenage years and the formation of your identity.', 2, 'The Basics'),
	('young_adulthood', 'Young Adulthood', 'Examine your early adult years, career choices, and relationships.', 3, 'The Game'),
	('midlife', 'Midlife Reflection', 'Consider your achievements, challenges, and growth during midlife.', 4, 'The Truth'),
	('mature_years', 'Mature Years & Wisdom', 'Reflect on the wisdom gained and legacy you wish to leave.', 5, 'The Journey'),
	('integration', 'Life Story Integration', 'Bring together the threads of your life story into a meaningful narrative.', 6, 'The Journey');


--
-- Data for Name: openai_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."openai_settings" ("id", "temperature", "updated_at") VALUES
	('0f3200fb-caee-49ca-bd37-97f0001b4f36', 0.2, '2025-05-23 11:08:08.155944+00');


--
-- Data for Name: prompt_template_parameters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."prompt_template_parameters" ("id", "template_id", "name", "description", "required", "position", "created_at", "updated_at") VALUES
	('3229761a-0a3f-4a89-9d3a-fd63007cf660', 'adabbd23-fecb-482b-9128-5a92c8f6c190', 'moduleTitle', 'The title of the module', true, 1, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('c9c83a3f-bc27-4770-a07d-1467e118a30d', 'adabbd23-fecb-482b-9128-5a92c8f6c190', 'moduleDescription', 'The description of the module', true, 2, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('557a9727-531e-4bec-864d-7336c0c11a86', '4b55c71c-3b57-40ed-b588-03be341f622f', 'moduleTitle', 'The title of the module', true, 1, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('58be6f62-85fb-4e46-9647-d77a29b08375', '4b55c71c-3b57-40ed-b588-03be341f622f', 'moduleIntroText', 'The introduction text for the module', true, 2, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('0065344d-327e-4691-a25d-58348b8d4911', '1c668f20-d0ff-46f7-ba36-89b199138961', 'prompt', 'The prompt to present to the user', true, 1, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('5a4b16c5-f2fa-4eb3-8d39-e5436c899467', '1c668f20-d0ff-46f7-ba36-89b199138961', 'context', 'Optional context for the prompt', false, 2, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('0be10b2d-a151-4cfe-bbae-305a6f0ba56e', '187cd67f-b4b7-41e7-8c0a-bb3dcaf17d76', 'moduleTitle', 'The title of the module', true, 1, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00'),
	('8621dcfe-10ac-4b3c-b0a4-c5f0bdf5f939', 'a4bf24ae-a288-4789-a01d-1c6b7b7e9d19', 'context', 'Optional context for the response', false, 1, '2025-05-23 11:08:08.140367+00', '2025-05-23 11:08:08.140367+00');


--
-- Data for Name: reflection_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."reflection_questions" ("id", "chapter_id", "text", "order", "created_at", "updated_at", "is_active") VALUES
	('6b919959-9e89-43ce-aaa1-07591a1b5a3a', '9e17df90-60e3-4d3d-8a01-68f0ec53304a', 'Reflect on how early experiences shaped your identity and values. Which moments or lessons stand out as significant?', 1, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('37fe5178-5629-4737-878d-a911637b1fe2', '9e17df90-60e3-4d3d-8a01-68f0ec53304a', 'Discuss how family dynamics influenced your sense of self-worth. Were there patterns of love, expectation, or neglect that impacted you?', 2, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('1245917a-88aa-4c66-83c6-a6ea1663236d', '9e17df90-60e3-4d3d-8a01-68f0ec53304a', 'Consider early challenges or responsibilities you faced. How did they build resilience or reveal your strengths?', 3, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('a1937999-9cc2-4121-ad9f-fc70f44b35c9', '9e17df90-60e3-4d3d-8a01-68f0ec53304a', 'Let’s start with your early years. Can you share a specific memory from your childhood that stands out? What did it teach you about yourself or your place in the world?', 4, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('1dbc2020-ce2a-450c-8b7c-463a2229ce3a', '9e17df90-60e3-4d3d-8a01-68f0ec53304a', 'Family dynamics play a big role in Season 1. What were some unspoken rules or expectations in your childhood home? How do they still influence your decisions or relationships?', 5, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('0d73d337-ba1c-47ea-82b7-6ea9df8c0314', 'f2fa406a-2b3a-4152-ac76-fc14dfa4fee6', 'Reflect on when you first sought approval or success. What drove you, and how did it feel?', 1, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('d4ff2aa4-21f6-471a-9c67-e9bfe9334d55', 'f2fa406a-2b3a-4152-ac76-fc14dfa4fee6', 'Discuss the systems (school, peers, society) that shaped your early ambitions. How did they influence your goals?', 2, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('a76f8853-666d-4c5a-aaf9-3369388f7f2e', 'f2fa406a-2b3a-4152-ac76-fc14dfa4fee6', 'Consider a skill you honed during this time. How did it define your path forward?', 3, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('bd40d3a8-2a84-41d6-9c4e-06e6faa087e2', 'f2fa406a-2b3a-4152-ac76-fc14dfa4fee6', 'When did you first start chasing something—approval, grades, or recognition? What motivated you back then?', 4, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('3739faa1-3635-49b9-92da-3e2e193c2023', 'f2fa406a-2b3a-4152-ac76-fc14dfa4fee6', 'Systems like school or peers set the stage. What pressures or expectations did you feel from them as you grew?', 5, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('449bf806-52f1-4c27-9701-2224ebe003b1', '7167242f-bb64-4268-880f-bc414ac08b15', 'Reflect on a time when life’s rules seemed to change unexpectedly. How did you respond?', 1, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('41f77f4a-88fb-4932-b8da-ea15f5b361d0', '7167242f-bb64-4268-880f-bc414ac08b15', 'Discuss how external systems (work, relationships) influenced your ability to adapt. What supported or hindered you?', 2, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('52b12c2e-a20a-40a0-be91-404d7f89cbd9', '7167242f-bb64-4268-880f-bc414ac08b15', 'Consider a skill that emerged during this shift. How did it help you navigate uncertainty?', 3, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('b2de44b7-3cf1-45b7-9bcf-c566e19256e8', '7167242f-bb64-4268-880f-bc414ac08b15', 'Life can throw curveballs. When did the rules of your world change unexpectedly? What happened?', 4, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('fa757800-72b5-47b0-a44d-dd899cc8ed3f', '7167242f-bb64-4268-880f-bc414ac08b15', 'Systems around you—like work or family—shape how you adapt. What helped or held you back during that change?', 5, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('5f4c2c2a-e202-4832-81b3-b3b70023298f', 'a3297435-a0c0-463a-9541-4b28fe0e9162', 'Reflect on what you gave up while chasing success. What were the trade-offs?', 1, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('4a7404a8-788e-445a-a95b-87d7f78931c0', 'a3297435-a0c0-463a-9541-4b28fe0e9162', 'Discuss how systems (career, culture) demanded those sacrifices. Were they worth it?', 2, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('a61051c6-f82d-41b5-8495-06c5ab3cc5f8', 'a3297435-a0c0-463a-9541-4b28fe0e9162', 'Consider a skill you leaned on to cope. How did it help you through this season?', 3, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('31b95a9f-a7cb-48a8-93be-a4f421a308e0', 'a3297435-a0c0-463a-9541-4b28fe0e9162', 'Chasing goals has a price. What did you sacrifice—time, relationships, or dreams—along the way?', 4, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('96d1dfa9-26b7-4fc0-8aa2-f80e5ea51b94', 'a3297435-a0c0-463a-9541-4b28fe0e9162', 'Systems like work or society often set the stakes. What did they demand from you during this time?', 5, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('7af82563-d1f2-4477-bc31-32ce835ec9cb', '1adbfa61-ad28-413a-89b0-3d4bdde936a5', 'Reflect on a moment you faced a hard truth about yourself or your path. What sparked it?', 1, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('8e636d4e-1f93-4cd0-b7d4-9e38ce789bd9', '1adbfa61-ad28-413a-89b0-3d4bdde936a5', 'Discuss how systems (relationships, faith) supported or challenged this awakening. What role did they play?', 2, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('0cf64347-7ef2-4bbf-9260-8fb90e85e664', '1adbfa61-ad28-413a-89b0-3d4bdde936a5', 'Consider a skill that grew from this realization. How did it redefine your journey?', 3, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('9e6973d3-d1ad-4283-91b7-5be88c0a5711', '1adbfa61-ad28-413a-89b0-3d4bdde936a5', 'Awakenings change us. When did you face a truth that stopped you in your tracks? What was it?', 4, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('178b5545-4091-45df-8855-8b3186e07b43', '1adbfa61-ad28-413a-89b0-3d4bdde936a5', 'Systems around you—like friends or beliefs—shape these moments. What supported or tested your awakening?', 5, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('51e8b7a0-9fbc-4500-8769-c7b5d585fffa', 'a126fe1e-9158-45d6-af11-18b9550da225', 'Reflect on a time you had to face the fallout of your choices. What did you learn?', 1, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('a1e816cc-cce0-4cef-92a7-64d38c4f284d', 'a126fe1e-9158-45d6-af11-18b9550da225', 'Discuss how systems (community, work) influenced your reckoning. Did they help or complicate it?', 2, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('af788ec4-911a-452a-96af-b9246c32ae47', 'a126fe1e-9158-45d6-af11-18b9550da225', 'Consider a skill that helped you own this moment. How did it strengthen you?', 3, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('838466dd-1185-4bff-a46f-e19826dd1b9d', 'a126fe1e-9158-45d6-af11-18b9550da225', 'Reckonings are tough. When did you have to face the consequences of your actions? What happened?', 4, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('e3f78226-8c60-434f-98d0-0a2e6ebd61da', 'a126fe1e-9158-45d6-af11-18b9550da225', 'Systems like community or work play a role. How did they shape your reckoning—supporting or judging?', 5, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('372cbbfb-8c7e-463b-8485-03161790fd03', '5af4d3b1-3023-43de-b184-e799c30e97f5', 'Reflect on how you rebuilt after a setback. What guided your new direction?', 1, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('c138c98f-1377-45d0-8c11-885852da01f8', '5af4d3b1-3023-43de-b184-e799c30e97f5', 'Discuss how systems (family, faith) supported this rebuilding. What did you rely on?', 2, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('4e5a6b15-8bb3-40b6-bfe2-0a335dffd07e', '5af4d3b1-3023-43de-b184-e799c30e97f5', 'Consider a skill that emerged in this process. How did it redefine your strengths?', 3, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('273d6651-5bc0-4365-ae8e-8611218ff43b', '5af4d3b1-3023-43de-b184-e799c30e97f5', 'Rebuilding takes courage. After a low point, how did you start piecing your life back together?', 4, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('bff0cf82-e787-4637-8d7d-1d3c5e0fc7e1', '5af4d3b1-3023-43de-b184-e799c30e97f5', 'Systems like family or faith can anchor us. What supported you as you rebuilt?', 5, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('bdfa0447-75e4-4717-9755-e10aec5e7d36', '5fa3ff92-6381-41ae-b0cd-dfcb720f6a71', 'Reflect on how past experiences now inform your present. What connects them?', 1, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('2023c7c5-02a9-4b8e-8ebb-2e12519da11c', '5fa3ff92-6381-41ae-b0cd-dfcb720f6a71', 'Discuss how systems (relationships, work) help you integrate your journey. What’s their role?', 2, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('155e6f9e-e74e-4ed7-aeec-333c35f645d2', '5fa3ff92-6381-41ae-b0cd-dfcb720f6a71', 'Consider a skill that ties your past and present. How does it bridge your seasons?', 3, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('52a94f5f-0c0e-4123-86cd-80dc0a168d18', '5fa3ff92-6381-41ae-b0cd-dfcb720f6a71', 'Integration weaves it all together. How do your past experiences shape who you are today?', 4, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('b4103749-edd0-414a-bf29-e214a8682517', '4eba0f8c-0973-4108-b150-525d95c3bf87', 'How old are you?', 2, '2025-05-23 11:08:08.091169+00', '2025-05-23 11:08:08.091169+00', true),
	('02f872c8-46ef-422c-8edd-0459fd979bca', '5fa3ff92-6381-41ae-b0cd-dfcb720f6a71', 'Systems like relationships or work help us connect the dots. How do they support your growth now?', 5, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('c2ab62dc-dee8-4d3c-985f-282837d62775', '57b75f86-03b9-4435-903a-caf84cbc42af', 'Reflect on navigating challenges with the guidance of your spiritual beliefs. Were there moments when your faith was tested? How did you respond?', 1, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('fb46d9f3-f799-4d77-a6b2-d9bcd13a5dc2', '57b75f86-03b9-4435-903a-caf84cbc42af', 'Consider how your definition of success has evolved. How do you balance success with authenticity?', 2, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('2780c30b-8deb-45cc-b976-5241069ef1ae', '57b75f86-03b9-4435-903a-caf84cbc42af', 'Reflect on moments of surrendering to greater truths or powers. How did these experiences foster personal growth or clarity?', 3, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('acf5d1a3-2995-4419-88e3-67fcabe40fd0', '57b75f86-03b9-4435-903a-caf84cbc42af', 'Can you recall a time when your beliefs—spiritual or otherwise—were tested? How did you respond?', 4, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('b214c93b-772d-4cbc-b7ff-9a8f9db3bf46', '57b75f86-03b9-4435-903a-caf84cbc42af', 'How has your definition of success evolved? What feels authentic to you now?', 5, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('09207005-57cd-4595-ba55-9c10a26eea90', '1a8a0059-8b89-49a3-8cd4-1eb9715a9657', 'Discuss the role of personal care and environment in your self-development. How do you prioritize mental and physical health?', 1, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('7ee9fab9-7418-4efa-8dc1-7dd55e0591b0', '1a8a0059-8b89-49a3-8cd4-1eb9715a9657', 'Reflect on using your unique gifts in personal or professional life. How does this impact your community and relationships?', 2, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('89dc026f-7b1c-4d0a-8067-08409f53e8b7', '1a8a0059-8b89-49a3-8cd4-1eb9715a9657', 'Consider how your perception of intelligence has influenced your sense of self-worth. Discuss integrating multiple intelligences into your personal growth.', 3, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('e26241fc-0279-450a-acba-6b0296bdc7b5', '1a8a0059-8b89-49a3-8cd4-1eb9715a9657', 'How do you prioritize your mental and physical health? What habits support you?', 4, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('dc516acb-c953-4ebf-aedc-014c4978f1a8', '1a8a0059-8b89-49a3-8cd4-1eb9715a9657', 'When have you used a skill to impact your community or relationships? What was the effect?', 5, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('c9b0c4a9-4ed7-4330-91b5-7609735ffda2', '649930bf-2cd0-4b5a-935c-7181db298065', 'Reflect on how your definition of success has evolved over time. What events or insights have shaped this understanding?', 1, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('66a46d60-ed7e-43b5-bdd2-79b23df0ef5a', '649930bf-2cd0-4b5a-935c-7181db298065', 'Discuss how you balance life’s priorities: family, career, health, and personal growth. What strategies have you found effective?', 2, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('0a275807-ba11-48cb-98d9-0c64eccbbbcd', '649930bf-2cd0-4b5a-935c-7181db298065', 'Reflect on overcoming societal expectations and traditional metrics of success. How have these influenced your decisions? What steps have you taken to stay true to your values?', 3, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('b6a8ffa0-abe1-4035-aa65-966999bfd4a0', '649930bf-2cd0-4b5a-935c-7181db298065', 'What events or insights have redefined success for you over time?', 4, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('cac8ee60-e264-4bcf-85ca-6b9b7f23d2df', '649930bf-2cd0-4b5a-935c-7181db298065', 'How do you manage family, career, health, and growth? What works for you?', 5, '2025-05-23 11:08:08.092736+00', '2025-05-23 11:08:08.092736+00', true),
	('e3882399-0d0e-47db-a953-e5070a522a81', '4eba0f8c-0973-4108-b150-525d95c3bf87', 'Hello, I am Serge, your AI voice therapist. I am here to guide you through a calm and structured process of self-exploration. To get started, may I have your first name and what brings you here today?', 1, '2025-05-23 11:08:08.091169+00', '2025-05-23 11:08:08.091169+00', true),
	('9766fdaa-a7b0-498a-8f34-9c7f2e601656', '4eba0f8c-0973-4108-b150-525d95c3bf87', 'What is your primary motivation or goal for using this application?', 3, '2025-05-23 11:08:08.091169+00', '2025-05-23 11:08:08.091169+00', true);


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
-- Name: health_check_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."health_check_id_seq"', 1, true);


--
-- PostgreSQL database dump complete
--

RESET ALL;
