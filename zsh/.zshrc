# Path to your oh-my-zsh installation.
export ZSH=/Users/hanwenhao/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
##############
#ZSH_THEME="robbyrussell"
#ZSH_THEME="avit"
ZSH_THEME="ys"
#ZSH_THEME="random"
#ZSH_THEME="strug"
#ZSH_THEME="fwalch"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

# User configuration

export PATH="/usr/local/Cellar/sphinx/2.2.11/bin:/usr/local/Cellar/node/6.3.0/lib/node_modules/cnpm/bin:/Users/hanwenhao/.composer/vendor/bin:/Users/hanwenhao/cocos2d-x-3.4/templates:/Applications/Cocos/tools/ant/bin:/Applications/Cocos/frameworks:/Users/hanwenhao/cocos2d-x-3.4/tools/cocos2d-console/bin:/Users/hanwenhao/.composer/vendor/bin:/Users/hanwenhao/cocos2d-x-3.4/templates:/Applications/Cocos/tools/ant/bin:/Applications/Cocos/frameworks:/Users/hanwenhao/cocos2d-x-3.4/tools/cocos2d-console/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"

#oracle config
#export ORACLE_HOME=/Users/hanwenhao/oracle/instantclient_bin32
#export DYLD_LIBRARY_PATH=$ORACLE_HOME
#export SQLPATH=$ORACLE_HOME
#export TNS_ADMIN=$ORACLE_HOME/admin
#export LANG=en_US.UTF8
#export NLS_LANG=AMERICAN_AMERICA.UTF8
#export NLS_DATE_FORMAT="yyyy-mm-dd HH24:MI:SS"

#export PATH=$PATH:$ORACLE_HOME:.


# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

## bindkey 终端按键绑定
# vi-mode
bindkey -v
bindkey -M vicmd "i" vi-insert
bindkey -M vicmd "I" vi-insert-bol
bindkey -M vicmd "h" vi-backward-char
bindkey -M vicmd "l" vi-forward-char
bindkey -M vicmd "H" vi-beginning-of-line
bindkey -M vicmd "L" vi-end-of-line
bindkey -M vicmd "j" down-line-or-search
bindkey -M vicmd "J" down-line-or-history
bindkey -M vicmd "k" up-line-or-search
bindkey -M vicmd "K" up-line-or-history
bindkey -M vicmd "u" undo
bindkey -M vicmd "=" vi-repeat-search

# autosuggestions
bindkey "^[\t" autosuggest-accept

# vi-mode光标
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
# use beam shape cursor on startup.
echo -ne '\e[5 q'

# use beam shape cursor for each new prompt.
preexec() {
        echo -ne '\e[5 q'
}

_fix_cursor() {
        echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

# fzf
export FZF_DEFAULT_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || ccat --color=always {} || cat {}) 2> /dev/null | head -500"'
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# export FZF_DEFAULT_COMMAND="rg --files --hidden -g'!.git'"
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX_HEIGHT='80%'
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || ccat --color=always {} || cat {}) 2> /dev/null | head -500'
source ~/.config/zsh/key-bindings.zsh
source ~/.config/zsh/completion.zsh

# Aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim='nvim'
alias vi='nvim'
alias vimdiff='nvim -d'
alias vd='nvim -d'
alias ra='/usr/local/bin/ranger'

alias s="neofetch"
alias c="clear"
alias z="nvim ~/.zshrc"
alias h="cd ~"
alias cat="ccat"

alias gstua="git stash-unapply|gst"

alias nginx.start="sudo nginx"
alias nginx.restart="sudo nginx -s reload"
alias nginx.stop="sudo nginx -s stop"
alias redis-trib="sudo ruby /usr/local/bin/redis-trib.rb"
alias redis.start="redis-server /usr/local/etc/redis.conf"
alias php.ctags="/usr/local/bin/phpctags"
alias mysql.start="sudo mysql.server start"
alias mysql.restart="sudo mysql.server restart"
alias php-fpm.start="sudo php-fpm"
alias php-fpm.stop="sh /usr/local/shell/php-fpm-stop.sh"
alias php-fpm.restart="sh /usr/local/shell/php-fpm-restart.sh"
# alias strace="dtruss"

export PATH="/usr/local/bin:/usr/local/sbin:/Users/hanwenhao/aircrack-ng/scripts:$PATH"

# export CPLUS_INCLUDE_PATH="$CPLUS_INCLUDE_PATH:/usr/local/include"
## oh-my-zsh 插件配置

# 加载插件
plugins=(
  git
  vi-mode
  colored-man-pages
  osx
  )

## 用户插件
# 命令自动补全
source /Users/hanwenhao/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# 高亮必须为最后一行
source /Users/hanwenhao/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## 环境变量
source $ZSH/oh-my-zsh.sh

# svn 设置
export SVN_EDITOR=vim

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Users/hanwenhao/Github/cocos2d-x/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Users/hanwenhao/Github"
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Users/hanwenhao/Github/cocos2d-x/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# llvm 设置
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

