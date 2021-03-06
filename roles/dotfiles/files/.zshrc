bindkey -e # emacs key bindings

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi

export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# add local gems to $PATH
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
PATH="$HOME/anaconda3/bin:$PATH"

# virtualenvwrapper settings
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/Projects
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

fpath=(/usr/local/share/zsh/site-functions /usr/local/share/zsh-completions $fpath)
export DEFAULT_USER=crainiarc
export PIP_DOWNLOAD_CACHE=~/.pip/download_cache

# Antigen bundles
source ~/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle brew
antigen bundle chruby
antigen bundle fasd
antigen bundle kennethreitz/autoenv
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen theme agnoster
antigen apply

# Clipper settings
alias clip="nc localhost 8377"

# tmuxinator settings
export DISABLE_AUTO_TITLE=true

eval "$(fasd --init auto)"
