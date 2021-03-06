#!/bin/sh

# use a fresh custom loader path
unset LD_LIBRARY_PATH

# shortcut
export FNCS2_INSTALL="$HOME/FNCS2-install"

# update LD_LIBRARY_PATH
if test "x$LD_LIBRARY_PATH" = x
then
    export LD_LIBRARY_PATH="$FNCS2_INSTALL/lib"
else
    export LD_LIBRARY_PATH="$FNCS2_INSTALL/lib:$LD_LIBRARY_PATH"
fi

# update PATH
if test "x$PATH" = x
then
    export PATH="$FNCS2_INSTALL/bin"
else
    export PATH="$FNCS2_INSTALL/bin:$PATH"
fi

export FNCS_LOG_STDOUT=no
export FNCS_LOG_FILE=yes

# run ns3 in separate window
export FNCS_CONFIG_FILE=test_fncs_msg_client.zpl
xterm -e ./firstN LinkModelGLDNS3.txt &

# run gld in separate window
unset FNCS_CONFIG_FILE
xterm -e gridlabd test_fncs_msg_client.glm &

# run fncs_broker in separate window
xterm -e fncs_broker 2 &

echo "running"
