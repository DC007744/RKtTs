console:

openai.ts:108 OpenAI settings loaded from defaults: {temperature: 0.2, defaultVoice: 'ash'}
userSessionContext.tsx:71 [UserSessionProvider] Loaded session from storage: c2e5b278-dea6-4888-aa75-2c94e51c09cb
hook.js:377 [UserSessionProvider] Loaded session from storage: c2e5b278-dea6-4888-aa75-2c94e51c09cb
userSessionContext.tsx:130 [UserSessionContext] Fetching/Initializing session data via /api/session/init for userId: c2e5b278-dea6-4888-aa75-2c94e51c09cb
HomePageContent.tsx:154 [HomePageContent] initialAgentSystemInstructions effect: {isSessionLoading: true, hasInstructions: false, templateTextProvided: false, onboardingComplete: false}
HomePageContent.tsx:177 [HomePageContent] Waiting for session to load before setting/fetching onboarding instructions.
HomePageContent.tsx:182 [HomePageContent] Derived currentStage: loading
HomePageContent.tsx:183 [HomePageContent] session?.currentModuleId: b5a2f882-ff52-48dd-88cb-51e2677e601c
HomePageContent.tsx:185 [HomePageContent] Session user details: {userId: 'c2e5b278-dea6-4888-aa75-2c94e51c09cb', name: null, onboardingComplete: false, supabaseSessionId: 'c2e5b278-dea6-4888-aa75-2c94e51c09cb'}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: true, sessionExists: true, instructionsExist: false, toolsExist: false, …}
log.ts:10 [2025-06-04T09:14:50.594Z] [useRealtimeVoice] [2025-06-04T09:14:50.594Z] Cleanup effect triggered.
lifecycle.ts:193 [2025-06-04T09:14:50.594Z] [useRealtimeVoice] cleanupResources: Cleaning up local resources (stream, audio element)
lifecycle.ts:200 [2025-06-04T09:14:50.594Z] [useRealtimeVoice] cleanupResources: Local resources cleaned up
HomePageContent.tsx:154 [HomePageContent] initialAgentSystemInstructions effect: {isSessionLoading: true, hasInstructions: false, templateTextProvided: false, onboardingComplete: false}
HomePageContent.tsx:177 [HomePageContent] Waiting for session to load before setting/fetching onboarding instructions.
HomePageContent.tsx:182 [HomePageContent] Derived currentStage: loading
HomePageContent.tsx:183 [HomePageContent] session?.currentModuleId: b5a2f882-ff52-48dd-88cb-51e2677e601c
HomePageContent.tsx:185 [HomePageContent] Session user details: {userId: 'c2e5b278-dea6-4888-aa75-2c94e51c09cb', name: null, onboardingComplete: false, supabaseSessionId: 'c2e5b278-dea6-4888-aa75-2c94e51c09cb'}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: true, sessionExists: true, instructionsExist: false, toolsExist: false, …}
userSessionContext.tsx:145 [UserSessionContext] /api/session/init response received: {sessionId: 'c2e5b278-dea6-4888-aa75-2c94e51c09cb', onboardingComplete: false, name: null, motivation: null, currentModuleId: 'b5a2f882-ff52-48dd-88cb-51e2677e601c', …}
userSessionContext.tsx:200 [UserSessionContext] Session context fully updated from /api/session/init response.
HomePageContent.tsx:125 [HomePageContent] Calculating currentStage: {isSessionLoading: false, onboardingComplete: false, currentModuleSlug: null, currentModuleId: 'b5a2f882-ff52-48dd-88cb-51e2677e601c'}
hook.js:377 [HomePageContent] Calculating currentStage: {isSessionLoading: false, onboardingComplete: false, currentModuleSlug: null, currentModuleId: 'b5a2f882-ff52-48dd-88cb-51e2677e601c'}
moduleOrder.ts:39 [moduleOrder] At beginning, returning same ID for computePrev: early_life
moduleOrder.ts:71 [moduleOrder] Moving from early_life to next: onboarding
hook.js:377 [moduleOrder] At beginning, returning same ID for computePrev: early_life
hook.js:377 [moduleOrder] Moving from early_life to next: onboarding
SessionModal.tsx:39 [SessionModal] Rendering with props: {isReturningUser: true, name: null, isSessionActive: false, onboardingComplete: false}
hook.js:377 [SessionModal] Rendering with props: {isReturningUser: true, name: null, isSessionActive: false, onboardingComplete: false}
SessionModal.tsx:39 [SessionModal] Rendering with props: {isReturningUser: false, name: undefined, isSessionActive: false, onboardingComplete: false}
hook.js:377 [SessionModal] Rendering with props: {isReturningUser: false, name: undefined, isSessionActive: false, onboardingComplete: false}
HomePageContent.tsx:154 [HomePageContent] initialAgentSystemInstructions effect: {isSessionLoading: false, hasInstructions: true, templateTextProvided: true, onboardingComplete: false}
HomePageContent.tsx:182 [HomePageContent] Derived currentStage: onboarding
HomePageContent.tsx:183 [HomePageContent] session?.currentModuleId: b5a2f882-ff52-48dd-88cb-51e2677e601c
HomePageContent.tsx:185 [HomePageContent] Session user details: {userId: 'c2e5b278-dea6-4888-aa75-2c94e51c09cb', name: null, onboardingComplete: false, supabaseSessionId: 'c2e5b278-dea6-4888-aa75-2c94e51c09cb'}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
SessionModal.tsx:39 [SessionModal] Rendering with props: {isReturningUser: true, name: null, isSessionActive: false, onboardingComplete: false}
hook.js:377 [SessionModal] Rendering with props: {isReturningUser: true, name: null, isSessionActive: false, onboardingComplete: false}
SessionModal.tsx:39 [SessionModal] Rendering with props: {isReturningUser: false, name: undefined, isSessionActive: false, onboardingComplete: false}
hook.js:377 [SessionModal] Rendering with props: {isReturningUser: false, name: undefined, isSessionActive: false, onboardingComplete: false}
SessionModal.tsx:39 [SessionModal] Rendering with props: {isReturningUser: true, name: null, isSessionActive: false, onboardingComplete: false}
hook.js:377 [SessionModal] Rendering with props: {isReturningUser: true, name: null, isSessionActive: false, onboardingComplete: false}
SessionModal.tsx:39 [SessionModal] Rendering with props: {isReturningUser: false, name: undefined, isSessionActive: false, onboardingComplete: false}
hook.js:377 [SessionModal] Rendering with props: {isReturningUser: false, name: undefined, isSessionActive: false, onboardingComplete: false}
HomePageContent.tsx:650 [HomePageContent] Session onboarding status (onUserInteract): {onboardingComplete: false, currentModuleId: 'b5a2f882-ff52-48dd-88cb-51e2677e601c', currentModuleSlug: null}
HomePageContent.tsx:669 [HomePageContent] Connecting voice for onboarding (onUserInteract) with: {toolsCount: 2, isInitialOnboardingConnection: true, currentStage: 'onboarding'}
log.ts:10 [2025-06-04T09:15:45.961Z] [useRealtimeVoice] [2025-06-04T09:15:45.961Z] connectVoice called with initialInstructions: provided, toolsCount: 2, isInitialOnboarding: true
index.ts:593 [ONBOARDING DEBUG] Initial onboarding_status metadata: {"name_collected":false,"motivation_collected":false}
index.ts:609 [ONBOARDING DEBUG] Added enhanced onboarding prompt rules to instructions for onboarding session.
index.ts:626 [ONBOARDING DEBUG] Effective connect options: {model: 'gpt-4o-realtime-preview-2024-12-17', voice: 'ash', instructions: 'You are Serge, an English-speaking AI voice therap…designed to guide users through a calm and str...', tools: Array(2), initialInstructions: 'undefined...', …}
log.ts:10 [2025-06-04T09:15:45.961Z] [useRealtimeVoice] [2025-06-04T09:15:45.961Z] Initializing/Re-initializing RealtimeClient for connect with model: gpt-4o-realtime-preview-2024-12-17
log.ts:10 [2025-06-04T09:15:45.962Z] [useRealtimeVoice] [2025-06-04T09:15:45.962Z] Setting session data: onboardingComplete=false, currentPrompt=null
realtime-client.ts:1140 [RealtimeClient] Session data set: {onboardingComplete: 'false', hasCurrentPrompt: 'false'}
log.ts:10 [2025-06-04T09:15:45.962Z] [useRealtimeVoice] [2025-06-04T09:15:45.962Z] Creating session with initial hook options - model: gpt-4o-realtime-preview-2024-12-17, tools: 0
log.ts:10 [2025-06-04T09:15:45.962Z] [RealtimeClient] Sending request body to /api/realtime/session: {
"model": "gpt-4o-realtime-preview-2024-12-17",
"voice": "ash",
"modalities": [
"audio",
"text"
],
"input_audio_transcription": {
"model": "whisper-1"
},
"turn_detection": {
"type": "server_vad",
"silence_duration_ms": 1000,
"create_response": false,
"interrupt_response": true
},
"tools": [
{
"type": "function",
"name": "capture_onboarding_details",
"description": "Captures the user's onboarding details (name and motivation). Only call this tool when both name and motivation have been collected (i.e., both fields are present in onboarding_status).",
"parameters": {
"type": "object",
"properties": {
"name": {
"type": "string",
"description": "The user's name."
},
"motivation": {
"type": "string",
"description": "The user's motivation for using the app."
},
"position": {
"type": "string",
"description": "User's current context or step in the onboarding flow (e.g., 'initial_prompt', 'module_intro'). Retrieved from session metadata."
}
},
"required": [
"name",
"motivation"
],
"additionalProperties": false
}
},
{
"type": "function",
"name": "say_goodbye_and_disconnect",
"description": "Signals that the user wants to end the session. The agent should provide a thoughtful goodbye message summarizing the conversation before disconnecting.",
"parameters": {
"type": "object",
"properties": {},
"required": []
}
}
],
"tool_choice": "auto"
}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
realtime-client.ts:516 [RealtimeClient] Received audio track for playback, stream ID: realtimeapi
log.ts:10 [2025-06-04T09:15:48.875Z] [useRealtimeVoice] [2025-06-04T09:15:48.875Z] Session connection successful.
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
realtime-client.ts:479 [RealtimeClient] WebRTC connection state: connecting
realtime-client.ts:479 [RealtimeClient] WebRTC connection state: connected
realtime-client.ts:973 [RealtimeClient] Data channel opened, Connected status set.
realtime-client.ts:1067 [RealtimeClient] Sending automatic response.create.
realtime-client.ts:1094 [RealtimeClient] Using mergedOptions.instructions for initial response.
realtime-client.ts:1115 [RealtimeClient] Sending initial responseEvent: {type: 'response.create', instructions: "You are Serge, an English-speaking AI voice therap…ou can use 'onboarding' for position if needed).\n", tools: Array(2), full_response: {…}}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
use-audio-visualizer.ts:55 [useAudioVisualizer] Setting up Input AudioContext and AnalyserNode
use-audio-visualizer.ts:72 [useAudioVisualizer] Input AudioContext setup complete.
use-audio-visualizer.ts:95 [useAudioVisualizer] Setting up Output AudioContext and AnalyserNode
use-audio-visualizer.ts:120 [useAudioVisualizer] Output AudioContext setup complete.
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: session.created
log.ts:10 [2025-06-04T09:15:49.868Z] [useRealtimeVoice] [2025-06-04T09:15:49.868Z] EVENT: Received session.created event
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: response.created
log.ts:10 [2025-06-04T09:15:49.992Z] [useRealtimeVoice] [2025-06-04T09:15:49.992Z] EVENT: Received response.created event
log.ts:10 [2025-06-04T09:15:49.992Z] [useRealtimeVoice] [2025-06-04T09:15:49.992Z] Response created with ID: resp_BeeVpShxR7nwLGeSSghoo
log.ts:10 [2025-06-04T09:15:49.992Z] [useRealtimeVoice] [2025-06-04T09:15:49.992Z] Response details: {"object":"realtime.response","id":"resp_BeeVpShxR7nwLGeSSghoo","status":"in_progress","status_details":null,"output":[],"conversation_id":"conv_BeeVot61fdlArCnJADOQt","modalities":["text","audio"],"voice":"ash","output_audio_format":"pcm16","temperature":0.8,"max_output_tokens":"inf","usage":null,"metadata":null}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: response.output_item.added
log.ts:10 [2025-06-04T09:15:50.360Z] [useRealtimeVoice] [2025-06-04T09:15:50.360Z] EVENT: Received response.output_item.added event
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: conversation.item.created
log.ts:10 [2025-06-04T09:15:50.361Z] [useRealtimeVoice] [2025-06-04T09:15:50.361Z] EVENT: Received conversation.item.created event
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: response.content_part.added
log.ts:10 [2025-06-04T09:15:50.361Z] [useRealtimeVoice] [2025-06-04T09:15:50.361Z] EVENT: Received response.content_part.added event
eventHandlers2.ts:219 [useRealtimeVoice][EVENT DEBUG] response.content_part.added: {
"type": "response.content_part.added",
"event_id": "event_BeeVqKbySciY7ADQ8Mja4",
"response_id": "resp_BeeVpShxR7nwLGeSSghoo",
"item_id": "item_BeeVp1saQ2nv6EIsVXTIO",
"output_index": 0,
"content_index": 0,
"part": {
"type": "audio",
"transcript": ""
}
}
log.ts:10 [2025-06-04T09:15:50.362Z] [useRealtimeVoice] [2025-06-04T09:15:50.362Z] Handler: Received AUDIO content part. Transcript: "". Item ID: item_BeeVp1saQ2nv6EIsVXTIO, Response ID: resp_BeeVpShxR7nwLGeSSghoo
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: output_audio_buffer.started
log.ts:10 [2025-06-04T09:15:50.453Z] [useRealtimeVoice] [2025-06-04T09:15:50.453Z] EVENT: Received output_audio_buffer.started event
log.ts:10 [2025-06-04T09:15:50.453Z] [useRealtimeVoice] [2025-06-04T09:15:50.453Z] Output audio started - assistant is speaking
log.ts:10 [2025-06-04T09:15:50.453Z] [useRealtimeVoice] [2025-06-04T09:15:50.453Z] Auto-muting microphone while agent speaks
log.ts:10 [2025-06-04T09:15:50.453Z] [useRealtimeVoice] [2025-06-04T09:15:50.453Z] Muting microphone
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: rate_limits.updated
log.ts:10 [2025-06-04T09:15:52.589Z] [useRealtimeVoice] [2025-06-04T09:15:52.589Z] EVENT: Received rate_limits.updated event
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: response.audio.done
log.ts:10 [2025-06-04T09:15:52.631Z] [useRealtimeVoice] [2025-06-04T09:15:52.631Z] EVENT: Received response.audio.done event
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: response.audio_transcript.done
log.ts:10 [2025-06-04T09:15:52.631Z] [useRealtimeVoice] [2025-06-04T09:15:52.631Z] EVENT: Received response.audio_transcript.done event
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: response.content_part.done
log.ts:10 [2025-06-04T09:15:52.631Z] [useRealtimeVoice] [2025-06-04T09:15:52.631Z] EVENT: Received response.content_part.done event
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: response.output_item.done
log.ts:10 [2025-06-04T09:15:52.632Z] [useRealtimeVoice] [2025-06-04T09:15:52.632Z] EVENT: Received response.output_item.done event
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: response.done
log.ts:10 [2025-06-04T09:15:52.632Z] [useRealtimeVoice] [2025-06-04T09:15:52.632Z] EVENT: Received response.done event
responseHandlers.ts:27 [2025-06-04T09:15:52.632Z] [useRealtimeVoice] handleResponseDone: Processing response.done event
responseHandlers.ts:44 [2025-06-04T09:15:52.632Z] [useRealtimeVoice] handleResponseDone: Response ID: resp_BeeVpShxR7nwLGeSSghoo
log.ts:10 [2025-06-04T09:15:52.632Z] [useRealtimeVoice] [2025-06-04T09:15:52.632Z] Response done received for ID: resp_BeeVpShxR7nwLGeSSghoo
log.ts:10 [2025-06-04T09:15:52.633Z] [useRealtimeVoice] [2025-06-04T09:15:52.633Z] Response done details: {"object":"realtime.response","id":"resp_BeeVpShxR7nwLGeSSghoo","status":"completed","status_details":null,"output":[{"id":"item_BeeVp1saQ2nv6EIsVXTIO","object":"realtime.item","type":"message","status":"completed","role":"assistant","content":[{"type":"audio","transcript":"Hello, I am Serge. I am h...
responseHandlers.ts:49 [useRealtimeVoice] FULL RESPONSE.DONE EVENT: {"type":"response.done","event_id":"event_BeeVsQ9BbEnU8dBYCip3J","response":{"object":"realtime.response","id":"resp_BeeVpShxR7nwLGeSSghoo","status":"completed","status_details":null,"output":[{"id":"item_BeeVp1saQ2nv6EIsVXTIO","object":"realtime.item","type":"message","status":"completed","role":"assistant","content":[{"type":"audio","transcript":"Hello, I am Serge. I am here to guide you through a calm and structured process of self-exploration. To get started, may I have your first name and what brings you here today?"}]}],"conversation_id":"conv_BeeVot61fdlArCnJADOQt","modalities":["text","audio"],"voice":"ash","output_audio_format":"pcm16","temperature":0.8,"max_output_tokens":"inf","usage":{"total_tokens":1289,"input_tokens":984,"output_tokens":305,"input_token_details":{"text_tokens":984,"audio_tokens":0,"cached_tokens":960,"cached_tokens_details":{"text_tokens":960,"audio_tokens":0}},"output_token_details":{"text_tokens":61,"audio_tokens":244}},"metadata":null}}
responseHandlers.ts:53 [useRealtimeVoice] Response output structure: [
{
"id": "item_BeeVp1saQ2nv6EIsVXTIO",
"object": "realtime.item",
"type": "message",
"status": "completed",
"role": "assistant",
"content": [
{
"type": "audio",
"transcript": "Hello, I am Serge. I am here to guide you through a calm and structured process of self-exploration. To get started, may I have your first name and what brings you here today?"
}
]
}
]
responseHandlers.ts:57 [useRealtimeVoice] Output item 0: {"id":"item_BeeVp1saQ2nv6EIsVXTIO","object":"realtime.item","type":"message","status":"completed","role":"assistant","content":[{"type":"audio","transcript":"Hello, I am Serge. I am here to guide you through a calm and structured process of self-exploration. To get started, may I have your first nam
responseHandlers.ts:61 [useRealtimeVoice] Found assistant item with ID: item_BeeVp1saQ2nv6EIsVXTIO
responseHandlers.ts:62 [useRealtimeVoice] Assistant item has 1 content parts
log.ts:10 [2025-06-04T09:15:52.633Z] [useRealtimeVoice] [2025-06-04T09:15:52.633Z] Adding assistant message: "Hello, I am Serge. I am here to guide you through ..."
responseHandlers.ts:213 [2025-06-04T09:15:52.632Z] [useRealtimeVoice] handleResponseDone: Disconnect in progress: false
responseHandlers.ts:214 [2025-06-04T09:15:52.632Z] [useRealtimeVoice] handleResponseDone: Pending recap response ID: not set
responseHandlers.ts:215 [2025-06-04T09:15:52.632Z] [useRealtimeVoice] handleResponseDone: Current response ID: resp_BeeVpShxR7nwLGeSSghoo
responseHandlers.ts:216 [2025-06-04T09:15:52.632Z] [useRealtimeVoice] handleResponseDone: Is recap response: false
responseHandlers.ts:217 [2025-06-04T09:15:52.632Z] [useRealtimeVoice] handleResponseDone: Current disconnect phase: idle
responseHandlers.ts:413 [useRealtimeVoice] FULL RESPONSE.DONE EVENT: {"object":"realtime.response","id":"resp_BeeVpShxR7nwLGeSSghoo","status":"completed","status_details":null,"output":[{"id":"item_BeeVp1saQ2nv6EIsVXTIO","object":"realtime.item","type":"message","status":"completed","role":"assistant","content":[{"type":"audio","transcript":"Hello, I am Serge. I am here to guide you through a calm and structured process of self-exploration. To get started, may I have your first name and what brings you here today?"}]}],"conversation_id":"conv_BeeVot61fdlArCnJADOQt","modalities":["text","audio"],"voice":"ash","output_audio_format":"pcm16","temperature":0.8,"max_output_tokens":"inf","usage":{"total_tokens":1289,"input_tokens":984,"output_tokens":305,"input_token_details":{"text_tokens":984,"audio_tokens":0,"cached_tokens":960,"cached_tokens_details":{"text_tokens":960,"audio_tokens":0}},"output_token_details":{"text_tokens":61,"audio_tokens":244}},"metadata":null}
responseHandlers.ts:416 [useRealtimeVoice] Response output structure: [
{
"id": "item_BeeVp1saQ2nv6EIsVXTIO",
"object": "realtime.item",
"type": "message",
"status": "completed",
"role": "assistant",
"content": [
{
"type": "audio",
"transcript": "Hello, I am Serge. I am here to guide you through a calm and structured process of self-exploration. To get started, may I have your first name and what brings you here today?"
}
]
}
]
responseHandlers.ts:429 [useRealtimeVoice] Output array has 1 items
responseHandlers.ts:433 [useRealtimeVoice] Output item 0: {"id":"item_BeeVp1saQ2nv6EIsVXTIO","object":"realtime.item","type":"message","status":"completed","role":"assistant","content":[{"type":"audio","transcript":"Hello, I am Serge. I am here to guide you through a calm and structured process of self-exploration. To get started, may I have your first nam
responseHandlers.ts:442 [useRealtimeVoice] Found assistant item with ID: item_BeeVp1saQ2nv6EIsVXTIO
responseHandlers.ts:449 [useRealtimeVoice] Assistant item has 1 content parts
responseHandlers.ts:453 [useRealtimeVoice] Content part 0 type: audio
responseHandlers.ts:460 [useRealtimeVoice] Found audio transcript: "Hello, I am Serge. I am here to guide you through ..."
log.ts:10 [2025-06-04T09:15:52.634Z] [useRealtimeVoice] [2025-06-04T09:15:52.634Z] Adding assistant message: "Hello, I am Serge. I am here to guide you through ..."
responseHandlers.ts:653 [2025-06-04T09:15:52.632Z] [useRealtimeVoice] handleResponseDone: Clearing response/refs and resetting isResponseInProgressRef
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
realtime-client.ts:854 [ONBOARDING DEBUG] Received event: output_audio_buffer.stopped
log.ts:10 [2025-06-04T09:16:02.757Z] [useRealtimeVoice] [2025-06-04T09:16:02.757Z] EVENT: Received output_audio_buffer.stopped event
log.ts:10 [2025-06-04T09:16:02.757Z] [useRealtimeVoice] [2025-06-04T09:16:02.757Z] handleOutputAudioStopped: Assistant finished speaking
log.ts:10 [2025-06-04T09:16:02.757Z] [useRealtimeVoice] [2025-06-04T09:16:02.757Z] Output audio stopped - assistant finished speaking. Duration: 12304ms
eventHandlers.ts:112 [DISCONNECT DEBUG] handleOutputAudioStopped: Current state:
eventHandlers.ts:113 [DISCONNECT DEBUG] - disconnectPhase = idle
eventHandlers.ts:114 [DISCONNECT DEBUG] - isSayingGoodbyeRef = false
eventHandlers.ts:115 [DISCONNECT DEBUG] - isDisconnectInProgressRef = false
eventHandlers.ts:116 [DISCONNECT DEBUG] - isMicrophoneManuallyMuted = false
eventHandlers.ts:118 [DISCONNECT DEBUG] handleOutputAudioStopped: Evaluating condition: state.disconnectPhase === "awaiting_recap" ( false ) || isSayingGoodbyeRef.current ( false )
log.ts:10 [2025-06-04T09:16:02.757Z] [useRealtimeVoice] [2025-06-04T09:16:02.757Z] Normal audio stop (not in disconnect flow)
eventHandlers.ts:167 [DISCONNECT DEBUG] handleOutputAudioStopped: Not in goodbye state, normal audio stop
log.ts:10 [2025-06-04T09:16:02.758Z] [useRealtimeVoice] [2025-06-04T09:16:02.758Z] Auto-unmuting microphone after agent finished speaking (manual mute state cleared)
log.ts:10 [2025-06-04T09:16:02.758Z] [useRealtimeVoice] [2025-06-04T09:16:02.758Z] Unmuting microphone
AudioVisualizer.tsx:305 [AudioVisualizer] Speaking source changed, fading out transcript
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
actions.ts:191 [useRealtimeVoice] Microphone muted successfully
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
AudioVisualizer.tsx:305 [AudioVisualizer] Speaking source changed, fading out transcript
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
AudioVisualizer.tsx:305 [AudioVisualizer] Speaking source changed, fading out transcript
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
AudioVisualizer.tsx:305 [AudioVisualizer] Speaking source changed, fading out transcript
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
AudioVisualizer.tsx:305 [AudioVisualizer] Speaking source changed, fading out transcript
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
AudioVisualizer.tsx:305 [AudioVisualizer] Speaking source changed, fading out transcript
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
AudioVisualizer.tsx:305 [AudioVisualizer] Speaking source changed, fading out transcript
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
AudioVisualizer.tsx:305 [AudioVisualizer] Speaking source changed, fading out transcript
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
AudioVisualizer.tsx:305 [AudioVisualizer] Speaking source changed, fading out transcript
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}
AudioVisualizer.tsx:305 [AudioVisualizer] Speaking source changed, fading out transcript
HomePageContent.tsx:270 [HomePageContent] useEffect for sessionId: Conditions not met. {sessionId: null, isSessionLoading: false, sessionExists: true, instructionsExist: true, toolsExist: true, …}

init call:

{sessionId: "c2e5b278-dea6-4888-aa75-2c94e51c09cb", onboardingComplete: false, name: null,…}
currentModule
:
{id: "b5a2f882-ff52-48dd-88cb-51e2677e601c", number: 0, title: "Onboarding", theme: "onboarding",…}
currentModuleId
:
"b5a2f882-ff52-48dd-88cb-51e2677e601c"
currentModuleSlug
:
null
currentPrompt
:
{id: "4ad7c949-e4c0-4274-bc44-8a337ccbb999", chapter_id: "b5a2f882-ff52-48dd-88cb-51e2677e601c",…}
currentPromptId
:
"4ad7c949-e4c0-4274-bc44-8a337ccbb999"
currentPromptTextForUser
:
"Hello, I am (introduce yourself)... I am here to guide you through a calm and structured process of self-exploration. To get started, may I have your first name and what brings you here today?"
initialAgentSystemInstructions
:
{,…}
modules
:
[{status: "in_progress", moduleId: "b5a2f882-ff52-48dd-88cb-51e2677e601c", lastPromptIndex: 0}]
motivation
:
null
name
:
null
onboardingComplete
:
false
openaiSettings
:
{model: "gpt-4o-realtime-preview-2024-12-17", voice: "ash", temperature: 0.2}
model
:
"gpt-4o-realtime-preview-2024-12-17"
temperature
:
0.2
voice
:
"ash"
recentChapterRecapText
:
""
sessionId
:
"c2e5b278-dea6-4888-aa75-2c94e51c09cb"
toolsForAgent
:
{tools: [{type: "function", name: "capture_onboarding_details",…},…], tool_choice: "auto"}
uuidToSlugMap
:
{b5a2f882-ff52-48dd-88cb-51e2677e601c: "onboarding",…}
