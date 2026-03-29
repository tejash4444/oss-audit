#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Tejash

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "=============================="
echo " Directory Audit Report"
echo "=============================="

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; thenved
        PERMS=$(ls -ld $DIR | awk '{print $1, $3, $4}')
        SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)
        echo "$DIR => Permissions: $PERMS | Size: $SIZE"
    else
        echo "$DIR does not exist on this system"
    fi
done

echo ""
echo "------------------------------"
echo " Git Configuration Check"
echo "------------------------------"

# Check Git config file
if [ -f "$HOME/.gitconfig" ]; then
    ls -ld $HOME/.gitconfig
else
    echo "Git config file not found in home directory"
fi
