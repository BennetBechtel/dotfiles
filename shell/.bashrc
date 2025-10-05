#
# ~/.bashrc – optimized for fast startup
#

# -----------------------------
# PATH
# -----------------------------
# Include pip/user programs and pyenv
export PATH="$HOME/.local/bin:$HOME/.local/opt/zen:$PATH"

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
# Prompt
# -----------------------------
PS1='[\u@\h \W]\$ '

# Starship prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

# -----------------------------
# Pyenv lazy loading
# -----------------------------
if command -v pyenv >/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    # Define a function to initialize pyenv only when first used
    pyenv() {
        # Remove this function to avoid recursion
        unset -f pyenv

        # Initialize pyenv
        eval "$(pyenv init --path)"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"

        # Call pyenv with original arguments
        command pyenv "$@"
    }
fi
