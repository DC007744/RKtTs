module.exports = {
  testEnvironment: 'jsdom',
  moduleNameMapper: {
    // Handle module aliases (adjust if your tsconfig.json differs)
    '^@/lib/(.*)$': '<rootDir>/lib/$1',
    '^@/components/(.*)$': '<rootDir>/components/$1',
    '^@/app/(.*)$': '<rootDir>/src/app/$1', // Assuming app directory is under src
    // Add other aliases as needed
  },
  setupFilesAfterEnv: ['<rootDir>/jest.setup.js'],
  // Explicitly tell Jest not to ignore any files for transformation, ensuring jest.setup.js is processed.
  transformIgnorePatterns: [],
  testPathIgnorePatterns: ['<rootDir>/node_modules/', '<rootDir>/.next/'],
  transform: {
    // Use babel-jest for ts/tsx/js/jsx files with the correct Babel config
    '^.+\\.(ts|tsx|js|jsx)$': ['babel-jest', { configFile: './babel.config.jest.js' }],
    // '^.+\\.css$': '<rootDir>/test/mocks/styleMock.js',
  },
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json', 'node'],
  // Add coverage configuration if desired
  // collectCoverage: true,
  // coverageDirectory: "coverage",
  // coverageProvider: "v8",
};