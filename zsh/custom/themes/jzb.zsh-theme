# kphoen.zsh-theme
# ------------------------------------------------------------------------------
#          FILE:  kphoen.zsh-theme
#   DESCRIPTION:  oh-my-zsh theme file.
#        AUTHOR:  Kévin Gomez (geek63@gmail.com)
#       VERSION:  1.0.0
#    SCREENSHOT:
# ------------------------------------------------------------------------------
# PROMPT='[%B%{$fg[red]%}%B%n%b%{$reset_color%}@%{$fg[magenta]%}%B%m%b%{$reset_color%}:%{$fg[blue]%}%B%~%b%{$reset_color%}$(git_prompt_info)]

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
    PROMPT='[%{$fg[red]%}%B%n%b%{$reset_color%}@%{$fg[magenta]%}%B%m%b%{$reset_color%}:%{$FG[166]%}%B%~%b%{$reset_color%}]
0 %{$fg[red]%}%B>%b%{$reset_color%} '

    # display exitcode on the right when >0
    #return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

    #RPROMPT='${return_code}%{$reset_color%}'
    RPROMPT='[%*]'
else
    PROMPT='[%B%n%b@%B%m%b:%B%~%b$(git_prompt_info)]
%# '

    ZSH_THEME_GIT_PROMPT_PREFIX=" on"
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    # display exitcode on the right when >0
    return_code="%(?..%? ↵)"

    RPROMPT='$(git_prompt_status)'
fi
