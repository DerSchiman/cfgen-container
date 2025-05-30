# Use official slim Python image
FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive \
    QT_QPA_PLATFORM=offscreen \
    PIP_NO_CACHE_DIR=off

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        xvfb \
        xauth \
        file \
        libegl1 \
        libgl1 \
        libglib2.0-0 \
        libxext6 \
        libsm6 \
        libxrender1 \
        libxcb-cursor0 \
        libxkbcommon-x11-0 \
        fontconfig \
        libdbus-1-3 \
        build-essential \
        python3-dev \
        curl \
        libxcb-icccm4 \
        libxcb-image0 \
        libxcb-keysyms1 \
        libxcb-randr0 \
        libxcb-render-util0 \
        libxcb-xinerama0 \
        libxcb-xkb1 && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install core Python deps
RUN pip install --upgrade pip

# # Optional: Preinstall Python packages
# COPY requirements.txt .
# RUN pip install --cache-dir /tmp/pip_cache opencv-python-headless && \
#     pip install --cache-dir /tmp/pip_cache -r requirements.txt

WORKDIR /app