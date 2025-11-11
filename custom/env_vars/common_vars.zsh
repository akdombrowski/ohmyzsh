#!/usr/bin/env bash

# export PATH="$PATH:$HOME/.local"
# export PATH="$PATH:bin"

export DEFAULT_USERNAME="akdombrowski"
export DEFAULT_USER="akdombrowski"

# put TABSIZE=0 in your environment, to tell `ls` to align using spaces, not tabs.
export TABSIZE=0

export OS="$(uname -sro)"
export OS_SPECIFIC_CONFIG_DIR="$ZSH_CUSTOM/os-specific-config"
export ENV_VARS_DIR="$ZSH_CUSTOM/env_vars"

export ZSH_ALIASES="$ZSH_CUSTOM/aliases"
export ZSH_FUNS="$ZSH_CUSTOM/funs"
export ZSH_SCRIPTS="$ZSH_CUSTOM/scripts"
export FUNZ="$ZSH_CUSTOM/funs"
export SCRIPTZ="$ZSH_CUSTOM/scripts"
export ALIASEZ="$ZSH_CUSTOM/aliases"

# export ZSH_CUSTOM

export WSL_ALIASES="wsl_aliases"
export WIN_ALIASES="win_aliases"
export MACOS_ALIASES="macos_aliases"

# ip of desktop
export LENNYDESK='15'

# Ollama
# Show additional debug information (e.g. OLLAMA_DEBUG=1) 
export OLLAMA_DEBUG=1
# IP Address for the ollama server (default 127.0.0.1:11434) 
export OLLAMA_HOST='127.0.0.1:11434'
# The duration that models stay loaded in memory (default "5m") 
export OLLAMA_KEEP_ALIVE='4m'
# Maximum number of loaded models per GPU 
# export OLLAMA_MAX_LOADED_MODELS=''
# Maximum number of queued requests 
export OLLAMA_MAX_QUEUE='5'
# The path to the models directory 
# export OLLAMA_MODELS=''
# Maximum number of parallel requests 
# export OLLAMA_NUM_PARALLEL=''
# Do not prune model blobs on startup 
# export OLLAMA_NOPRUNE=''
# A comma separated list of allowed origins 
export OLLAMA_ORIGINS='localhost,127.0.0.1'
# Always schedule model across all GPUs 
export OLLAMA_SCHED_SPREAD='true'
# Enabled flash attention 
# export OLLAMA_FLASH_ATTENTION=''
# Quantization type for the K/V cache (default: f16) 
export OLLAMA_KV_CACHE_TYPE='f32'
# Set LLM library to bypass autodetection 
# export OLLAMA_LLM_LIBRARY=''
# Reserve a portion of VRAM per GPU (bytes) 
export OLLAMA_GPU_OVERHEAD='1024'
# How long to allow model loads to stall before giving up (default "5m") 
export OLLAMA_LOAD_TIMEOUT='1m'