#!/usr/bin/env bash

# insync.sh - for awseasy

# my awseasy
echo; echo ${GREEN} ~/.awseasy/awseasy ${YELLOW}
diff -sb ./awseasy ~/.awseasy/awseasy
echo ${RESET}
ls -la ./awseasy ~/.awseasy/awseasy

# my awseasy.gen
echo; echo ${GREEN} ~/.awseasy/awseasy.gen ${YELLOW}
diff -sb ./awseasy.gen ~/.awseasy/awseasy.gen
echo ${RESET}
ls -la ./awseasy.gen ~/.awseasy/awseasy.gen

# my awseasy.ec2
echo; echo ${GREEN} ~/.awseasy/awseasy.ec2 ${YELLOW}
diff -sb ./awseasy.ec2 ~/.awseasy/awseasy.ec2
echo ${RESET}
ls -la ./awseasy.ec2 ~/.awseasy/awseasy.ec2

exit

# this needs to be a function

# my functions
echo; echo ${GREEN} ~/.bash-func.sh ${YELLOW}
diff -sb ./dot.bash-func.sh ~/.bash-func.sh
echo ${RESET}
ls -la ./dot.bash-func.sh ~/.bash-func.sh

# my vimrc
echo; echo ${GREEN}  ~/.vimrc ${YELLOW}
diff -sb ./dot.vimrc ~/.vimrc
echo ${RESET}
ls -la ./dot.vimrc ~/.vimrc

exit

-rw-r--r--  1 jdlt  staff  2621 Mar 24 20:24 future-features
-rw-r--r--  1 jdlt  staff  4740 Mar 24 20:24 ec2.type.csv
-rw-r--r--  1 jdlt  staff    18 Mar 24 20:24 contributors.txt
-rw-r--r--  1 jdlt  staff   208 Mar 24 20:24 awseasy.ver
-rw-r--r--  1 jdlt  staff  1493 Mar 24 20:24 awseasy.s3c
-rw-r--r--  1 jdlt  staff  2998 Mar 24 20:24 awseasy.net
-rw-r--r--  1 jdlt  staff  1314 Mar 24 20:24 awseasy.gen
-rw-r--r--  1 jdlt  staff  5168 Mar 24 20:24 awseasy.elb
-rw-r--r--  1 jdlt  staff  5565 Mar 24 20:24 awseasy.ec2
-rw-r--r--  1 jdlt  staff  9891 Mar 24 20:24 awseasy.asg
-rwxr-xr-x  1 jdlt  staff   640 Mar 24 20:24 awseasy
-rw-r--r--  1 jdlt  staff  3718 Mar 24 20:24 README.md
-rwxr-xr-x  1 jdlt  staff   466 Mar 24 22:18 insync.sh
-rw-r--r--  1 jdlt  staff   142 Mar 24 22:18 awseasy.iam
