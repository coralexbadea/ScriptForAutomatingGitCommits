#!/usr/bin/expect -f

# A script for automating git commits for your bitbucket repository. Follow the steps:
# 0. Install expect Package with command: sudo apt-get install -y expect
# 1. Move this file in the folder created with git clone where you desire to commit something
# 2. type chmod +777 scriptpush.sh
# 3. put you password and username in the specified places
# 4. type ./scriptpush.sh

#for issues send me a message at alex_badea99@yahoo.com

#put your password here
set PASSWORD here
#put you bitbucket username here / mine is "aedab" <<==
set USERNAME aedab 

set prompt {\$ $}    ; # this is a regular expression that should match the
                       # *end* of you bash prompt. Alter it as required.
spawn bash
expect -re $prompt

send "git add .\r"

send "git commit -a -m\"message\"\r"

send "git push\r"
expect {
    "Password for 'https://$USERNAME@bitbucket.org': " {
        send "$PASSWORD\r"
        exp_continue
    }
    -re $prompt
}

expect eof