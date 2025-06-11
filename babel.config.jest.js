module.exports = {
  presets: [
    ['@babel/preset-env', { targets: { node: 'current' } }], // Target current Node version for Jest
    '@babel/preset-typescript', // To handle TypeScript syntax if needed
    '@babel/preset-react', // Enable JSX/TSX parsing for React components
  ],
};