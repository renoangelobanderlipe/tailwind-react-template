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

rm $(pwd)/App.css
rm $(pwd)/App.jsx

cat <<EOT > index.css

@tailwind base;
@tailwind components;
@tailwind utilities;

EOT

rm -rf $(pwd)/assets

mkdir pages components


cd ./pages

touch HomePage.jsx

cat  <<EOT > HomePage.jsx


import React, { Fragment } from 'react';

const HomePage = () => {
  return (
    <Fragment>
      Starter Template for ${template_name}
    </Fragment>
  );
}

export default HomePage;



EOT


cd ../

cat <<EOT > main.jsx


import React from 'react'
import ReactDOM from 'react-dom/client'
import { PAGES } from './routes';

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    {PAGES.map((item) => item.component)}
  </React.StrictMode>,
)


EOT


cat <<EOT > routes.jsx

import React from 'react';
import HomePage from './pages/HomePage.jsx'

export const PAGES = [
  {
    name : "Home Page",
    path : "/home",
    component : <HomePage />
  }
]



EOT