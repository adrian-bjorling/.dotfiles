### EXPORT ###
export TERM="xterm-256color"                      # getting proper colors
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
export PATH="$HOME/.emacs.d/bin:$PATH"

# use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# use neovim for vim if present.
[ -x "$(command -v nvim)" ] && alias vim="nvim" vimdiff="nvim -d"

### SET VI MODE ###
# Comment this line out to enable default emacs-like bindings
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### ALIASES ###
# cd
alias ..="cd .."

# planner
alias planner="python ~/doc/scripts/my-extended-proaccess-planner.py"
alias fetch-planner="python ~/doc/scripts/fetch-proaccess-planner.py"

# Changing "ls" to "exa"
alias \
  ls="exa -al --color=always --group-directories-first" \
  la="exa -a --color=always --group-directories-first" \
  ll="exa -l --color=always --group-directories-first" \
  lt="exa -aT --color=always --group-directories-first" \
  l.='exa -a | grep -E "^\."'

alias \
  pac-up="sudo pacman -Syu" \
  pac-get="sudo pacman -S" \
  pac-rmv="sudo pacman -Rcns" \
  pac-rmv-sec="sudo pacman-R" \
  pac-qry="sudo pacman -Ss" \
  pac-cln="sudo pacman -Scc"

# git
alias \
  addup="git add -u" \
  addall="git add ." \
  branch="git branch" \
  checkout="git checkout" \
  clone="git clone" \
  commit="git commit -m" \
  fetch="git fetch" \
  pull="git pull origin" \
  push="git push origin" \
  stat="git status" \
  tag="git tag" \
  newtag="git tag -a"

# power management
alias \
  po="systemctl poweroff" \
  sp="betterlockscreen --suspend" \
  rb="systemctl reboot"

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init bash)"
