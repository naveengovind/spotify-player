#!/bin/bash

# Launch spotify_player in Ghostty with tmux for optimal image quality
# This ensures proper terminal support for high-quality images

# Kill any existing spotify_player instances
pkill -f spotify_player

# Launch Ghostty with tmux using our optimized config and run spotify_player
open -a Ghostty --args -e "tmux -f /Users/naveen/spotify-player/tmux_spotify.conf new-session -d -s spotify_player 'cd /Users/naveen/spotify-player && spotify_player' \; attach-session -t spotify_player"
