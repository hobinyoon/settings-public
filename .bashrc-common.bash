# Multi-line grep allowing one or more white spaces between words
mgrep()
{
  PATTERN=""
  for ((i=1; i<=$#; i++)); do
    #printf "[%s]\n" ${!i}
    if [ "$i" -ne "1" ]; then
      PATTERN+="(\s)+"
    fi
    PATTERN+=${!i}
  done
  #printf "[%s]\n" $PATTERN

  pcregrep --color -niM "$PATTERN" *

# Getting n-th argument:
#   http://stackoverflow.com/questions/1497811/how-to-get-the-nth-positional-argument-in-bash
# Getting the last argument:
#   http://stackoverflow.com/questions/1853946/getting-the-last-argument-passed-to-a-shell-script
}

# -i: request confirmation
alias rm='rm -i'

# -C: always colorize
alias tree='tree -C'

# -N: line numbers
# -R: colorize
alias less='less -NR'

# Print timestamp in history [https://askubuntu.com/a/391087]
HISTTIMEFORMAT="%F %T "

# Colorize jq output even when it's outputting to pipe
alias jq='jq -C'

HOBIN_SETTINGS_PUBLIC_PATH=$(dirname $(realpath ${BASH_SOURCE}))
alias cdsettings='cd ${HOBIN_SETTINGS_PUBLIC_PATH}'

alias cdcode='cd ~/code'

alias tf='terraform'
# alias tfplan='terraform plan -refresh-only'

alias alert='while [ 1 ]; do echo -n -e "\a."; sleep 1; done'

alias grep='grep --color'

# git
# alias gitlog='git log -n 1 -p'
# alias gitlog='git log --graph'
# https://stackoverflow.com/questions/1441010/the-shortest-possible-output-from-git-log-containing-author-and-date
# alias gitlog='git log --pretty=format:"%h%x09%an%x09%ad%x09%s" -n 10'
#
# %h commit hash
# %ad date
# %an name
# %ae email
# %s subject

gitlog() {
  local branch_name="${1:-}"
  git log --pretty=format:"%h %ad %an %ae %s" --date=format:"%Y-%m-%d %H:%M" $branch_name | grep -v "auto-commit] integrate with" | head -n 15
}

gitpull_() {
  for i in {1..10}; do
    echo "git pull: Attempt ${i}"
    git pull
    if [[ "$?" -eq 0 ]]; then
      echo "git pull: Attempt ${i} succeeded."
      break
    fi
    echo "git pull: Attempt ${i} failed."
  done

  for i in {1..10}; do
    echo "git submodule update: Attempt ${i}"
    git submodule update
    if [[ "$?" -eq 0 ]]; then
      echo "git submodule update: Attempt ${i} succeeded."
      break
    fi

    echo "git submodule update: Attempt ${i} failed."
  done
}

gitpull() {
  time gitpull_; alert
}


# Delete all branches except main and the checked out one
# Warning: Revisit this. This is dangerous. I think it accidentally deleted the
# remote dev branch.
# alias git-delete-all-branches='git branch | grep -v "main" | grep -v "^*" | xargs git branch -D'

alias gsm='git switch master'
alias gb='git branch'
alias gr='git fetch origin master && git rebase origin/master'

# Starship
eval "$(starship init bash)"
