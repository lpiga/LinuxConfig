local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

# Grab the current date (%W) and time (%t):
LEONARDO_TIME_="%{$fg_bold[yellow]%}%W%{$reset_color%}-%{$fg_bold[white]%}%t %{$reset_color%}"

# Grab the current machine name 
LEONARDO_MACHINE_="%{$fg_bold[blue]%}%m%{$fg[white]%}:%{$reset_color%}"

# Grab the current username 
LEONARDO_CURRENT_USER_="%{$fg_bold[green]%}%n%{$reset_color%}"

# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository: ~aw@master
LEONARDO_LOCA_="%{$fg[cyan]%}%~\$(git_prompt_info)%{$reset_color%}"

#ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}@%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}%{$fg[red]%}✗ %{$reset_color%}"
# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔ "

PROMPT="$LEONARDO_TIME_$LEONARDO_CURRENT_USER_@$LEONARDO_MACHINE_$LEONARDO_LOCA_${ret_status}%{$reset_color%}"
