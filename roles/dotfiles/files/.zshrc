bindkey -e # emacs key bindings

export EDITOR='vim'
export LANG=en_US.UTF-8

# virtualenvwrapper settings
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/Projects
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

eval "$(fasd --init auto)"