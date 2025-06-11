/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx}',
    './components/**/*.{js,ts,jsx,tsx}',
    './app/**/*.{js,ts,jsx,tsx}',
    './src/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {
      colors: {
        // Define custom colors based on design
        primary: {
          bg: '#F7D7A3',
          dark: '#503C2E',
        },
        text: {
          base: '#352712',
          light: '#FFFFFF',
          muted: '#86766B',
        },
        accent: {
          green: '#5D7246',
          gold: '#C6860E',
        },
        // Keep existing brand-teal for consistency with AudioVisualizer
        'brand-teal': '#00cccc',
      },
      fontFamily: {
        // Define custom fonts
        sans: ['Inter', 'sans-serif'],
        serif: ['Playfair Display', 'serif'],
        'train-one': ['"Train One"', 'system-ui'], // Keep Train One font family
      },
      borderRadius: {
        blob: '48px',
      },
      keyframes: {
        'pulse-once': {
          '0%, 100%': { opacity: 1 },
          '50%': { opacity: 0.5 },
        },
        'fadeIn': {
          'from': { opacity: 0, transform: 'translateY(10px)' },
          'to': { opacity: 1, transform: 'translateY(0)' }
        },
        'pulseGlow': {
          '0%': { boxShadow: '0 0 5px rgba(255, 255, 255, 0.5)' },
          '50%': { boxShadow: '0 0 20px rgba(255, 255, 255, 0.8)' },
          '100%': { boxShadow: '0 0 5px rgba(255, 255, 255, 0.5)' }
        },
        'border': {
          'to': { '--border-angle': '360deg' },
        },
        'logo-shadow-pulse': { // Keyframes for logo shadow
          '0%, 100%': { textShadow: '0 0 3px rgba(0, 0, 0, 0.2)' },
          '50%': { textShadow: '0 0 8px rgba(0, 0, 0, 0.4)' },
        },
        'pulseGlow-light': { // Keyframes for light mode glow
          '0%, 100%': { boxShadow: '0 0 5px rgba(0, 204, 204, 0.4)' }, // Use brand-teal with alpha
          '50%': { boxShadow: '0 0 15px rgba(0, 204, 204, 0.7)' }, // Use brand-teal with alpha
        }
      },
      animation: {
        'pulse-once': 'pulse-once 1s cubic-bezier(0.4, 0, 0.6, 1)',
        'fadeIn': 'fadeIn 0.3s ease-out forwards',
        'pulseGlow': 'pulseGlow 2s infinite', // Dark mode glow (white shadow)
        'pulseGlow-light': 'pulseGlow-light 2s infinite', // Light mode glow (teal shadow)
        'border': 'border 4s linear infinite',
        'logo-shadow-pulse': 'logo-shadow-pulse 3s ease-in-out infinite',
      }
    },
  },
  plugins: [
    // Temporarily commented out custom scrollbar plugin for debugging
    /*
    // Using function form to avoid require() style import
    // @ts-expect-error - Custom plugin implementation
    function({ addUtilities }) {
      const newUtilities = {
        '.scrollbar-thin': {
          scrollbarWidth: 'thin',
          '&::-webkit-scrollbar': {
            width: '6px',
          },
        },
        '.scrollbar-thumb-white\/20': {
          scrollbarColor: 'rgba(255, 255, 255, 0.2) transparent',
          '&::-webkit-scrollbar-thumb': {
            backgroundColor: 'rgba(255, 255, 255, 0.2)',
            borderRadius: '3px',
          },
        },
        '.scrollbar-thumb-white\/30': {
          scrollbarColor: 'rgba(255, 255, 255, 0.3) transparent',
          '&::-webkit-scrollbar-thumb': {
            backgroundColor: 'rgba(255, 255, 255, 0.3)',
            borderRadius: '3px',
          },
        },
        '.scrollbar-track-transparent': {
          scrollbarTrackColor: 'transparent',
          '&::-webkit-scrollbar-track': {
            backgroundColor: 'transparent',
          },
        },
      };
      addUtilities(newUtilities);
    },
    */
  ],
}