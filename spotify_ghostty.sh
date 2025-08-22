#!/bin/bash

# Script to run spotify_player with proper Ghostty detection in tmux
# This ensures high-quality images work correctly

echo "🎵 Starting Spotify Player with Ghostty + tmux image support..."

# Kill any existing instances
pkill -f spotify_player

# Set environment variables for Ghostty detection
export TERM_PROGRAM=ghostty
export GHOSTTY_RESOURCES_DIR=/Applications/Ghostty.app/Contents/Resources

# Ensure we're in the right directory
cd /Users/naveen/spotify-player

# Run spotify_player
spotify_player
