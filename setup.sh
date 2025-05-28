#!/bin/bash
set -e

echo "AI Translation App Setup Script"

# For V1: Node.js app
if [ -d "V1/llm_chatter" ]; then
  echo "Installing Node.js dependencies for V1/llm_chatter..."
  cd V1/llm_chatter
  npm install
  npm run serve &
  cd ../..
fi

# For V2: Pure HTML/JS (no build step)
if [ -d "V2" ]; then
  echo "Opening V2 web app in your default browser..."
  if command -v xdg-open &> /dev/null; then
    xdg-open V2/index.html
  elif command -v open &> /dev/null; then
    open V2/index.html
  else
    echo "Please open V2/index.html manually in your browser."
  fi
fi

echo "Setup complete!"
