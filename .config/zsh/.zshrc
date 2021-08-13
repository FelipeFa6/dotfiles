# Enable colors and change prompt:

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info  }
precmd_functions+=( precmd_vcs_info  )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
 zstyle ':vcs_info:git:*' formats '%b'

autoload -U colors && colors	# Load colors
PS1="%B %~ % %{$fg[green]%}% $%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Git shortcuts
alias gs='git status'
alias gb='git branch -avv'
alias gl='git log'
alias ga='git add'
alias gd='git diff'
alias gc='git commit'
alias gp='git pull'

# Extra Shortcuts
alias chw='xwallpaper --stretch'
alias ls='ls --color=auto'
alias sensors='watch -n 0 sensors'
alias screenshot='maim -s | xclip -selection clipboard -t image/png'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"';

# Bindings
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
