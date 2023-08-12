#!/bin/sh

SSH_PATH=$HOME/.ssh
chmod 700 $SSH_PATH
for file in "`find $SSH_PATH -type f | grep -vE "\.pub$"`"; do chmod 600 $file; done
for file in "`find $SSH_PATH -type f | grep -E "\.pub$"`"; do chmod 644 $file; done
