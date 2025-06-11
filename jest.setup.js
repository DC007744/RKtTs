import '@testing-library/jest-dom';

// Mock localStorage
const localStorageMock = (function() {
  let store = {};
  return {
    getItem: jest.fn(key => store[key] || null),
    setItem: jest.fn((key, value) => {
      store[key] = value.toString();
    }),
    removeItem: jest.fn(key => {
      delete store[key];
    }),
    clear: jest.fn(() => {
      store = {};
    })
  };
})();

Object.defineProperty(window, 'localStorage', {
  value: localStorageMock
});

// Mock AudioContext
window.AudioContext = jest.fn().mockImplementation(() => {
  return {
    createBufferSource: jest.fn().mockImplementation(() => ({
      connect: jest.fn(),
      start: jest.fn(),
      stop: jest.fn(),
      addEventListener: jest.fn(), // Add missing methods if needed by tests
      removeEventListener: jest.fn(),
      buffer: null,
      loop: false,
      loopEnd: 0,
      loopStart: 0,
      onended: null,
      playbackRate: { value: 1, setValueAtTime: jest.fn() },
      // Add other properties/methods as needed
    })),
    createMediaStreamSource: jest.fn().mockImplementation(() => ({
      connect: jest.fn()
    })),
    createAnalyser: jest.fn().mockImplementation(() => ({
      connect: jest.fn(),
      fftSize: 2048, // Default value
      frequencyBinCount: 1024, // Default value
      getByteFrequencyData: jest.fn(),
      getByteTimeDomainData: jest.fn(),
      // Add other properties/methods as needed
    })),
    createGain: jest.fn().mockImplementation(() => ({
      connect: jest.fn(),
      gain: { value: 1, setValueAtTime: jest.fn() }
    })),
    destination: { maxChannelCount: 2 }, // Mock destination properties
    currentTime: 0,
    sampleRate: 44100,
    state: 'running',
    decodeAudioData: jest.fn().mockResolvedValue({}), // Mock promise resolution
    close: jest.fn().mockResolvedValue(undefined), // Mock promise resolution
    resume: jest.fn().mockResolvedValue(undefined),
    suspend: jest.fn().mockResolvedValue(undefined),
    // Add other properties/methods as needed
  };
});

// Mock MediaRecorder
window.MediaRecorder = jest.fn().mockImplementation(() => {
  return {
    start: jest.fn(),
    stop: jest.fn(),
    ondataavailable: jest.fn(),
    onerror: jest.fn(), // Add onerror
    onstart: jest.fn(),
    onstop: jest.fn(),
    state: 'inactive',
    mimeType: 'audio/webm', // Add mimeType
    stream: { getTracks: jest.fn(() => [{ stop: jest.fn() }]) }, // Mock stream and tracks
    // Add other properties/methods as needed
  };
});
// Add isTypeSupported mock
window.MediaRecorder.isTypeSupported = jest.fn(() => true);


// Mock fetch
global.fetch = jest.fn(() =>
  Promise.resolve({
    ok: true,
    status: 200,
    json: async () => ({}), // Default mock response
    arrayBuffer: async () => new ArrayBuffer(0), // Add arrayBuffer mock
    // Add other response methods if needed
  })
);

// Mock navigator.mediaDevices
if (typeof navigator !== 'undefined' && !navigator.mediaDevices) {
  navigator.mediaDevices = {};
}
if (typeof navigator !== 'undefined' && navigator.mediaDevices && !navigator.mediaDevices.getUserMedia) {
  navigator.mediaDevices.getUserMedia = jest.fn(() =>
    Promise.resolve({
      getTracks: jest.fn(() => [{ stop: jest.fn() }]),
      // Add other MediaStream methods/properties if needed
    })
  );
}

// Mock URL.createObjectURL and revokeObjectURL
if (typeof window !== 'undefined') {
  window.URL.createObjectURL = jest.fn(() => 'mock-object-url');
  window.URL.revokeObjectURL = jest.fn();
}

// Mock WebRTC related objects if needed by RealtimeClient tests (though maybe not needed for ContextService)
if (typeof window !== 'undefined') {
  window.RTCPeerConnection = jest.fn().mockImplementation(() => ({
    createOffer: jest.fn().mockResolvedValue({ sdp: 'mock-offer', type: 'offer' }),
    createAnswer: jest.fn().mockResolvedValue({ sdp: 'mock-answer', type: 'answer' }),
    setLocalDescription: jest.fn().mockResolvedValue(undefined),
    setRemoteDescription: jest.fn().mockResolvedValue(undefined),
    addTrack: jest.fn(),
    createDataChannel: jest.fn(() => ({
        readyState: 'open',
        send: jest.fn(),
        close: jest.fn(),
        onopen: null,
        onclose: null,
        onmessage: null,
        onerror: null,
    })),
    close: jest.fn(),
    iceGatheringState: 'complete',
    iceConnectionState: 'completed',
    signalingState: 'stable',
    onicecandidate: null,
    oniceconnectionstatechange: null,
    onconnectionstatechange: null,
    onsignalingstatechange: null,
    ontrack: null,
    ondatachannel: null,
    // Add other RTCPeerConnection methods/properties if needed
  }));
  window.RTCSessionDescription = jest.fn().mockImplementation(desc => desc);
  window.RTCIceCandidate = jest.fn().mockImplementation(candidate => candidate);
}
// Polyfill global Request and Response for API route/integration tests
if (typeof global.Request === 'undefined') {
  global.Request = class {
    constructor(input, init) {
      this.input = input;
      this.init = init;
    }
  };
}
if (typeof global.Response === 'undefined') {
  global.Response = class {
    constructor(body, init) {
      this.body = body;
      this.init = init;
    }
    json() { return Promise.resolve(this.body); }
    text() { return Promise.resolve(typeof this.body === 'string' ? this.body : JSON.stringify(this.body)); }
  };
}