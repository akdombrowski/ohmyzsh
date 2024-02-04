# This scripts is copied from (MIT License):
<<<<<<< HEAD
# https://github.com/dotnet/toolset/blob/master/scripts/register-completions.zsh

_dotnet_zsh_complete() 
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet
=======
# https://raw.githubusercontent.com/dotnet/sdk/main/scripts/register-completions.zsh

#compdef dotnet
_dotnet_completion() {
  local -a completions=("${(@f)$(dotnet complete "${words}")}")
  compadd -a completions
  _files
}

compdef _dotnet_completion dotnet
>>>>>>> 21243709 (fix(sublime): pass user's env to `sst` (#12194))

# Aliases bellow are here for backwards compatibility
# added by Shaun Tabone (https://github.com/xontab) 

alias dn='dotnet new'
alias dr='dotnet run'
alias dt='dotnet test'
alias dw='dotnet watch'
alias dwr='dotnet watch run'
alias dwt='dotnet watch test'
alias ds='dotnet sln'
alias da='dotnet add'
alias dp='dotnet pack'
alias dng='dotnet nuget'
alias db='dotnet build'
