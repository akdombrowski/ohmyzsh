#!/usr/bin/env bash

export PATH="$PATH:$HOME/.local"
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
OLLAMA_DEBUG=''
# IP Address for the ollama server (default 127.0.0.1:11434) 
OLLAMA_HOST=''
# The duration that models stay loaded in memory (default "5m") 
OLLAMA_KEEP_ALIVE=''
# Maximum number of loaded models per GPU 
OLLAMA_MAX_LOADED_MODELS=''
# Maximum number of queued requests 
OLLAMA_MAX_QUEUE=''
# The path to the models directory 
OLLAMA_MODELS=''
# Maximum number of parallel requests 
OLLAMA_NUM_PARALLEL=''
# Do not prune model blobs on startup 
OLLAMA_NOPRUNE=''
# A comma separated list of allowed origins 
OLLAMA_ORIGINS='localhost,127.0.0.1'
# Always schedule model across all GPUs 
OLLAMA_SCHED_SPREAD='true'
# Enabled flash attention 
OLLAMA_FLASH_ATTENTION=''
# Quantization type for the K/V cache (default: f16) 
OLLAMA_KV_CACHE_TYPE='f32'
# Set LLM library to bypass autodetection 
OLLAMA_LLM_LIBRARY=''
# Reserve a portion of VRAM per GPU (bytes) 
OLLAMA_GPU_OVERHEAD='1024'
# How long to allow model loads to stall before giving up (default "5m") 
OLLAMA_LOAD_TIMEOUT='1m'