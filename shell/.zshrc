#
# ~/.zshrc – based on your bashrc
#

# -----------------------------
# PATH
# -----------------------------
  #export PATH="$HOME/.local/bin:$HOME/.local/opt/zen:$PATH"

# -----------------------------
# Basic aliases
# -----------------------------
alias cls="reset"
alias vi="nvim"
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
