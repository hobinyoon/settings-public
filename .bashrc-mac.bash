# fzf: a command line fuzz finder (https://github.com/junegunn/fzf)
#   Automatically installed by something. Let's leave it for now.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

# Terraform autocomplete [https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli]
complete -C /opt/homebrew/bin/terraform terraform

# Push to origin, create a PR using the first commit, and open the link in the
# web browser.
alias gitpush='git push origin `git branch --show-current` && gh pr create -f -w'
