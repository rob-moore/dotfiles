source ~/.zplug/init.zsh


# Prezto Modules
zplug "modules/completion", from:prezto
zplug "modules/history", from:prezto
zplug "modules/utility", from:prezto



### General ZSH Plugins ###
zplug "chrissicool/zsh-256color", from:github
zplug "zsh-users/zsh-completions", from:github
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:2
zplug "zsh-users/zsh-history-substring-search", from:github, defer:3
zplug "djui/alias-tips", from:github



### Fuzzy Finder ###
zplug "junegunn/fzf-bin", from:gh-r, as:command, if:"(( ! $+commands[fzf] ))", rename-to:fzf
zplug "junegunn/fzf", from:github, use:shell/key-bindings.zsh



### JSON ###
zplug "stedolan/jq", from:gh-r, as:command, if:"(( ! $+commands[jq] ))", rename-to:jq


## Z ##
zplug "rupa/z", from:github, use:z.sh

### SSH ###
zplug "hkupty/ssh-agent", from:github



### Git Plugins ###
zplug "plugins/git", from:oh-my-zsh
zplug "Seinh/git-prune", from:github



### NodeJS ###
zplug "lukechilds/zsh-nvm", from:github
zplug "lukechilds/zsh-better-npm-completion", from:github



### Directory Navigation ###
zplug "supercrabtree/k", from:github
zplug "b4b4r07/enhancd", from:github, use:init.sh
zplug "mollifier/anyframe", from:github
zplug "RobSis/zsh-reentry-hook", from:github


### Pure Theme ###
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme



### Install Missing Plugins & Initialize zplug ###
if ! zplug check; then
  zplug install; zplug load
else
  zplug load
fi


# Then, source plugins and add commands to $PATH
zplug load


#SSH stuff
if [ $(ssh-add -l | grep -c "The agent has no identities." ) -eq 1 ]; then
  if [[ "$(uname -s)" == "Darwin" ]]; then
    # We're on OS X. Try to load ssh keys using pass phrases stored in
    # the OSX keychain.
    #
    # You can use ssh-add -K /path/to/key to store pass phrases into
    # the OSX keychain
    ssh-add -k
  fi
fi

if [ -f ~/.ssh/id_rsa ]; then
  if [ $(ssh-add -l | grep -c ".ssh/id_rsa" ) -eq 0 ]; then
    ssh-add ~/.ssh/id_rsa
  fi
fi

if [ -f ~/.ssh/id_dsa ]; then
  if [ $(ssh-add -L | grep -c ".ssh/id_dsa" ) -eq 0 ]; then
    ssh-add ~/.ssh/id_dsa
  fi
fi


#Cool aliases
source $HOME/.zsh_aliases

export PATH="$PATH:/usr/local/Cellar/yarn/[version]/bin"
#export PATH="$HOME/.yarn/bin:$PATH"

