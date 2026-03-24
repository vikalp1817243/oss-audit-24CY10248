#!/bin/bash

# Script 5: The Open Source Manifesto Generator
# unless shopt -s expand_aliases is set, but we demonstrate the concept here)
# alias create_file='touch'

echo "============================================="
echo "   The Open Source Manifesto Generator       "
echo "============================================="
echo "Answer three brief questions to generate your manifesto."
echo ""

# Get user input interactively
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you in computing? " FREEDOM
read -p "3. Name one thing you would like to build and share freely: " BUILD

# Fetch current date and format it
DATE=$(date '+%d %B %Y')
# Generate a unique output filename based on the current user
OUTPUT="manifesto_$(whoami).txt"

echo ""
echo "Drafting manifesto..."
sleep 1 # Adds a nice dramatic pause

# Compose the paragraph and write to the file using redirection (>)
# Using a Here-Doc for cleaner multi-line text generation
cat <<EOF > "$OUTPUT"
--------------------------------------------------
A DEVELOPER's MANIFESTO
Date: $DATE
Author: $(whoami)
--------------------------------------------------

I believe that software shapes human reality. 
Every single day, I rely on community-built tools like $TOOL to do my work. 
Because of this, I understand that in the realm of computing, freedom fundamentally means $FREEDOM. 

I do not want to just consume; I intend to contribute. 
Standing on the shoulders of the open-source giants who came before me, 
my goal is to one day build $BUILD and release it back to the community, 
sharing it freely so that others may learn from it, improve it, and build upon it.

The code is open. The future is open.
--------------------------------------------------
EOF

echo "[SUCCESS] Manifesto generated and saved to: $OUTPUT"
echo "Here is what you wrote:"
echo "============================================="
# Read the file back to the terminal
cat "$OUTPUT"
echo "============================================="
