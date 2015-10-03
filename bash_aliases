alias reload='. $HOME/.bashrc'

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

alias mystart='mysql.server start'
alias mystop='mysql.server stop'

alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop"

alias tmux="tmux -2"

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
  # git push origin ${NEW_TAG}
}

function git-sweep-remote {
  git remote prune origin
  git branch --remotes --merged master | sed "s/  origin\///" | \
    grep --color=auto -v 'master' | xargs -n 1 -I '{}' -t git push origin :{}
}
