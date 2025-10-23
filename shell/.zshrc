#
# ~/.zshrc – based on your bashrc
#


# -----------------------------
# Keybinds
# -----------------------------
# Use emacs-style keybindings
bindkey -e

# Ctrl + Left/Right = move by word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Page Up/Down = search through history
#bindkey '^[[5~' history-beginning-search-backward
#bindkey '^[[6~' history-beginning-search-forward


# --- Unbind PageUp / PageDown ---
bindkey -r '^[[5~'   # PageUp
bindkey -r '^[[6~'   # PageDown

# -----------------------------
# PATH
# -----------------------------
  #export PATH="$HOME/.local/bin:$HOME/.local/opt/zen:$PATH"

# -----------------------------
# Basic aliases
# -----------------------------
alias cls="reset"
alias vi="nvim"
alias yz="yazi"
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Only run the following for interactive shells
[[ $- != *i* ]] && return

# -----------------------------
# Prompt / Starship
# -----------------------------
# Use Starship if available
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    PROMPT='[%n@%m %1~]$ '
fi

# -----------------------------
# Pyenv lazy loading
# -----------------------------
if command -v pyenv >/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    pyenv() {
        unset -f pyenv
        eval "$(pyenv init --path)"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
        command pyenv "$@"
    }
fi

# -----------------------------
# History configuration
# -----------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS       # don’t record duplicate commands
setopt HIST_IGNORE_ALL_DUPS   # delete old entries when a duplicate is added
setopt HIST_IGNORE_SPACE      # don’t record commands starting with a space
setopt HIST_SAVE_NO_DUPS      # don’t write duplicate commands to the history file
setopt HIST_VERIFY            # don’t auto-execute recalled command until Enter
setopt APPEND_HISTORY         # append history instead of overwriting
setopt SHARE_HISTORY          # share history across all zsh sessions

# -----------------------------
# Zsh plugins (Fish-like behavior)
# -----------------------------

# Autosuggestions
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Extra completions
fpath+=('/usr/share/zsh/site-functions')
autoload -Uz compinit && compinit

# Syntax highlighting (must be last!)
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
