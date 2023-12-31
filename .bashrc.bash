# We get the real path of the file being sourced in SCRIPT_PATH even when the file is a symbolic link [https://askubuntu.com/a/1066549]
SCRIPT_PATH=$(dirname $(realpath ${BASH_SOURCE}))

. $SCRIPT_PATH/.bashrc-common.bash

uname_str=`uname`

if [ "${uname_str}" == "Darwin" ]; then
  . $SCRIPT_PATH/.bashrc-mac.bash
elif [ "${uname_str}" == "Linux" ]; then
  . $SCRIPT_PATH/.bashrc-linux.bash
fi
