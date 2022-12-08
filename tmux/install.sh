#!/bin/bash

a=${apt-cache show tmux}
if [[ $a == 0 ]]
then
echo "the program doesn't exist"
sudo apt-get install tmux &&
# ttps://askubuntu.com/questions/436908/how-can-i-check-for-apt-get-errors-in-a-bash-script  
echo "the program exists"
fi

echo $1

