module.exports = {
  purge: [],
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      backgroundImage: {
        'custom-pattern': "url('.\\img\\fundo-button.png')",
        'blood-pattern2':
          "linear-gradient(rgba(255, 0, 0, 0.5), rgba(255, 0, 0, 0.5)), url('.\\img\\fundo-button.png')",
      },
    },
  },
  plugins: [require('daisyui')],
};
