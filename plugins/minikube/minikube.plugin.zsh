<<<<<<< HEAD
# Autocompletion for Minikube.
#
if (( $+commands[minikube] )); then
    __MINIKUBE_COMPLETION_FILE="${ZSH_CACHE_DIR}/minikube_completion"

    if [[ ! -f $__MINIKUBE_COMPLETION_FILE ]]; then
        minikube completion zsh >! $__MINIKUBE_COMPLETION_FILE
    fi

    [[ -f $__MINIKUBE_COMPLETION_FILE ]] && source $__MINIKUBE_COMPLETION_FILE

    unset __MINIKUBE_COMPLETION_FILE
fi
=======
if (( ! $+commands[minikube] )); then
  return
fi

# If the completion file doesn't exist yet, we need to autoload it and
# bind it to `minikube`. Otherwise, compinit will have already done that.
if [[ ! -f "$ZSH_CACHE_DIR/completions/_minikube" ]]; then
  typeset -g -A _comps
  autoload -Uz _minikube
  _comps[minikube]=_minikube
fi

minikube completion zsh >| "$ZSH_CACHE_DIR/completions/_minikube" &|
>>>>>>> 21243709 (fix(sublime): pass user's env to `sst` (#12194))
