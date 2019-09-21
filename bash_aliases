alias reload='. $HOME/.bashrc'

alias vi='nvim'
alias vim='nvim'
alias ll='ls -Gahl'
alias ls='ls -G'

alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias bil='bundle install --local'

alias gpl='git pull'
alias gps='git push'
alias gm='git commit -v'
alias gma='git commit --amend --no-edit'
alias grm='git rebase master --preserve-merges'
alias grc='git rebase --continue'
alias gl='git log'
alias gs='git status'
alias gc='git checkout'
alias gd='git diff --color'
alias gdc='git diff --cached --color'
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gbn='git checkout -b'
alias gx='git branch --merged | grep -v "master" | xargs -n 1 git branch -d'

alias dps="docker ps --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}'"
alias dri="docker images -q -f dangling=true | xargs docker rmi"
alias drc="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"
alias fix-clock='docker run --rm --privileged ubuntu:trusty date -s "`date`"'

alias stg="aem use staging; assh ubuntu@web-stg"
alias prod="aem use prod; assh ubuntu@web-prod"

alias tmux="tmux -2"

alias dv="cd ~/dev"
alias ae="cd ~/dev/app-environs"
alias uw="cd ~/dev/unido-web"
alias rc="cd ~/dev/librato-railscore"
alias api="cd ~/dev/api"
alias ap="cd ~/dev/admin-panel"
alias apc="cd ~/dev/admin-panel/packages/admin-panel-client"
alias aps="cd ~/dev/admin-panel/packages/admin-panel-server"
alias sk="cd ~/dev/skeletor"

alias opsapi-prod="ssh -v -i ~/.awsam/accts/prod/keys/portal-keypair/key.pem ubuntu@10.164.197.159 -L 9090:172.26.49.32:9090 -N"
alias opsapi-staging="ssh -v -i ~/.awsam/accts/prod/keys/portal-keypair/key.pem ubuntu@10.164.197.159 -L 9090:opsapi-ext-aostg.librato.com:9443 -N"

function tit() { echo -n -e "\033]0;$@\007"; }

function git-tag-next {
  PREV_TAG=`git describe | cut -d '-' -f 1`;
  TAG_PREFIX=`echo $PREV_TAG | sed -e 's/[0-9][0-9]*$//'`;
  CURR_TAG=`echo $PREV_TAG | sed -e 's/^[^0-9]*//'`;
  if [ -z $CURR_TAG ]; then
      echo "Can not parse tag!";
      return 1;
  fi;
  NEW_TAG=$(( $CURR_TAG + 1 ));
  NEW_TAG="${TAG_PREFIX}${NEW_TAG}";
  echo "Bumping tag from ${PREV_TAG} -> ${NEW_TAG}";
  MSG="$1";
  if [ -z "$MSG" ]; then
      MSG=$NEW_TAG;
  fi;
  git tag -a $NEW_TAG -m "${MSG}";
  git push origin ${NEW_TAG}
}

function git-sweep-remote {
  git remote prune origin
  git branch --remotes --merged master | sed "s/  origin\///" | \
    grep --color=auto -v 'master' | xargs -n 1 -I '{}' -t git push origin :{}
}

get_pw () {
  security find-generic-password -ga "$1" -w
}
