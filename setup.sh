#!/bin/bash

echo "Enter Your Template Name: "
read template_name

npm create vite@latest ${template_name} -- --template react

cd ${template_name}

npm install -D tailwindcss postcss autoprefixer

npx tailwindcss init -p

cat <<EOT > tailwind.config.js

/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

EOT

cd ./src

cat <<EOT > index.css

@tailwind base;
@tailwind components;
@tailwind utilities;

EOT

rm -rf $(pwd)/assets

mkdir pages

cd ./pages

touch HomePage.jsx

cat  <<EOT > HomePage.jsx

import React from 'react';

const HomePage = () => {
  return (
    <Fragment>
      Home Page
    </Fragment>
  );
}

export default HomePage;

EOT


