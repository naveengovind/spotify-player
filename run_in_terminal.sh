#!/bin/bash

# Simple script to run spotify_player in a proper terminal
# This will work better than VS Code's integrated terminal

echo "🎵 Starting Spotify Player with high-quality image support..."
echo "📝 Make sure you're running this in a terminal that supports images:"
echo "   - Ghostty (recommended)"
echo "   - iTerm2"
echo "   - Kitty"
echo "   - Or any terminal with sixel support"
echo ""

# Kill any existing instances
pkill -f spotify_player

# Set environment variables for better image support
export TERM=xterm-256color

# Run spotify_player
cd /Users/naveen/spotify-player
spotify_player
