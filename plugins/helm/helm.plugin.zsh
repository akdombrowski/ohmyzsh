if (( ! $+commands[helm] )); then
  return
fi

# If the completion file does not exist, generate it and then source it
# Otherwise, source it and regenerate in the background
if [[ ! -f "$ZSH_CACHE_DIR/completions/_helm" ]]; then
  helm completion zsh | tee "$ZSH_CACHE_DIR/completions/_helm" >/dev/null
  source "$ZSH_CACHE_DIR/completions/_helm"
else
  source "$ZSH_CACHE_DIR/completions/_helm"
  helm completion zsh | tee "$ZSH_CACHE_DIR/completions/_helm" >/dev/null &|
fi

alias h='helm'
alias hin='helm install'
<<<<<<< HEAD
=======
alias hun='helm uninstall'
>>>>>>> 21243709 (fix(sublime): pass user's env to `sst` (#12194))
alias hse='helm search'
alias hup='helm upgrade'
