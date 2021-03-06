#Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Do not let background jobs interrupt what the foreground
NO_NOTIFY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
    git
    osx
    pip
    vi-mode
# automatically source virtualenvs
    virtualenvwrapper
    fabric
    autojump
    )

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

source ~/.rc.sh

alias zshrc='vim ~/.zshrc; source ~/.zshrc'

# Do not correct commands listed in `~/.zsh_nocorrect`
if [ -f ~/.zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < .zsh_nocorrect
fi

function chpwd() {
    # Set up zsh options to emulate the specified shell as much as possible.

    # Source `.env` files
    # This is useful for when environmental variables need to be set while
    # working on a specific project
    test -f .env && source .env
}

# If the contents of the current working directory have changed, `ls`.
function precmd() {

    a=$(cat ~/.contents)
    b=$(ls)
    if [ $a = $b ]
    then
    else
        emulate -L zsh
            ls
    fi
    ls > ~/.contents
}
