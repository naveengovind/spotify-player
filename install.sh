#!/bin/bash

# Installation script for spotify-player with improved image rendering

echo "Installing spotify-player with improved image rendering..."

# Clone the repository if not already present
if [ ! -d "spotify-player" ]; then
    echo "Cloning spotify-player repository..."
    git clone https://github.com/bbzylstra/spotify-player.git
    cd spotify-player
else
    echo "Using existing spotify-player directory..."
    cd spotify-player
fi

# Detect OS and set appropriate features
OS=$(uname -s)
FEATURES=""

case "$OS" in
    Linux*)
        # Check for PulseAudio
        if command -v pactl &> /dev/null; then
            FEATURES="pulseaudio-backend"
        else
            # Check for ALSA
            if [ -d "/proc/asound" ]; then
                FEATURES="alsa-backend"
            else
                FEATURES="rodio-backend"
            fi
        fi
        ;;
    Darwin*)
        # macOS - use rodio backend
        FEATURES="rodio-backend"
        
        # Check if PulseAudio is installed via Homebrew
        if brew list pulseaudio &> /dev/null; then
            echo "PulseAudio detected on macOS, using pulseaudio-backend"
            FEATURES="pulseaudio-backend"
        fi
        ;;
    *)
        echo "Unknown OS: $OS, using default rodio backend"
        FEATURES="rodio-backend"
        ;;
esac

# Add common features
FEATURES="$FEATURES,pixelate,streaming,media-control,image"

echo "Building with features: $FEATURES"

# Build and install
cargo install --path spotify_player/ --no-default-features --features "$FEATURES"

if [ $? -eq 0 ]; then
    echo "Installation successful!"
    echo "You can now run 'spotify_player' from your terminal"
    echo ""
    echo "To enable sixel support for better image quality:"
    echo "1. Install libsixel: brew install libsixel (macOS) or apt install libsixel-dev (Linux)"
    echo "2. Set image_protocol = \"sixel\" in your ~/.config/spotify-player/app.toml"
    echo ""
    echo "For square album art, the code has been updated to ensure square aspect ratio."
else
    echo "Installation failed. Please check the error messages above."
    exit 1
fi