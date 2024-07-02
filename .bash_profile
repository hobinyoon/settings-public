if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hobin/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/hobin/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hobin/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/hobin/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/install-cli
complete -C /opt/homebrew/bin/terraform terraform
