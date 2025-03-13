#!/bin/bash

# Nom du projet
APP_NAME="trkn-amazon-prime"

echo "🚀 Création de l'application React (PWA) : $APP_NAME ..."
npx create-react-app "$APP_NAME" --template cra-template-pwa --use-npm

# Vérifier si la création a réussi
if [ $? -ne 0 ]; then
    echo "❌ Erreur lors de la création de l'application React PWA."
    exit 1
fi

cd "$APP_NAME" || exit

echo "📦 Installation des dépendances supplémentaires..."
npm install react-router-dom axios styled-components

echo "🎨 Ajout de Tailwind CSS..."
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

# Configuration de Tailwind CSS
cat > tailwind.config.js <<EOL
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {},
  },
  plugins: [],
};
EOL

# Ajouter Tailwind dans index.css
cat > src/index.css <<EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

echo "🛠 Initialisation de Git..."
git init
git add .
git commit -m "Initial commit"

echo "✅ Installation terminée !"
echo "📂 Ton projet PWA est prêt dans le dossier $APP_NAME"
