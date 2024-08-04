# HOBIN_SETTINGS_PUBLIC_PATH to get an absolute path even when the file is a symbolic link [https://askubuntu.com/a/1066549]
# Note: Make sure ${BASH_SOURCE} exists - the default MacOS shell is zsh. You
# can change the shell with $ chsh -s /bin/bash
HOBIN_SETTINGS_PUBLIC_PATH=$(dirname $(realpath ${BASH_SOURCE}))

. $HOBIN_SETTINGS_PUBLIC_PATH/.bashrc-common.bash

uname_str=`uname`

if [ "${uname_str}" == "Darwin" ]; then
  . $HOBIN_SETTINGS_PUBLIC_PATH/.bashrc-mac.bash
elif [ "${uname_str}" == "Linux" ]; then
  . $HOBIN_SETTINGS_PUBLIC_PATH/.bashrc-linux.bash
fi
