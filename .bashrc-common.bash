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

# -a: include . files
# -h: use unit suffixes
# -l: long format
# -G: colorized output
alias ll='ls -ahlG'

# -i: request confirmation
alias rm='rm -i'

# -C: always colorize
alias tree='tree -C'

# -R: colorize
alias less='less -R'

# Print timestamp in history [https://askubuntu.com/a/391087]
HISTTIMEFORMAT="%F %T "

# Colorize jq output even when it's outputting to pipe
alias jq='jq -C'

SCRIPT_PATH=$(dirname $(realpath ${BASH_SOURCE}))
alias cdsettings='cd ${SCRIPT_PATH}'

alias cdrepos='cd ~/repos'

alias tf='terraform'
# alias tfplan='terraform plan -refresh-only'

# Push to origin, create a PR using the first commit, and open the link in the
# web browser.
alias gitpush='git push origin `git branch --show-current` && gh pr create -f -w'
