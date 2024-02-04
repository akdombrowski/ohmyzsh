# Don't continue if direnv is not found
command -v direnv &>/dev/null || return

_direnv_hook() {
  trap -- '' SIGINT;
<<<<<<< HEAD
  eval "$(direnv hook zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z ${precmd_functions[(r)_direnv_hook]} ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z ${chpwd_functions[(r)_direnv_hook]} ]]; then
=======
  eval "$(direnv export zsh)";
  trap - SIGINT;
}
typeset -ag precmd_functions;
if [[ -z "${precmd_functions[(r)_direnv_hook]+1}" ]]; then
  precmd_functions=( _direnv_hook ${precmd_functions[@]} )
fi
typeset -ag chpwd_functions;
if [[ -z "${chpwd_functions[(r)_direnv_hook]+1}" ]]; then
>>>>>>> 21243709 (fix(sublime): pass user's env to `sst` (#12194))
  chpwd_functions=( _direnv_hook ${chpwd_functions[@]} )
fi
