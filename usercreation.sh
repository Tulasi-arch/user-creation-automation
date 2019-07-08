#!/bin/bash

read -p "Enter the Username :" USERNAME
#read -s -p "Enter the Password for $USERNAME: " PASSWORD
if [[ -z "$USERNAME" ]]
 then
  echo "PLEASE ENTER THE USERNAME"
  else
EXUSER=$(cat /etc/passwd | grep -i $USERNAME | cut -d ":" -f1)
if [[ "$USERNAME" == "$EXUSER" ]]
then
echo "User already existed, please use a different username"
else 
SPEC='!@#$%^&*()_'
SPECPASS=$(echo $SPEC | fold -3 | shuf | head -1)
PASSWORD=Tulasi@$RANDOM$SPECPASS
useradd $USERNAME

echo $PASSWORD | passwd $USERNAME --stdin
passwd -e $USERNAME
echo
echo
echo "================================================= "
cat /etc/passwd | grep -i $USERNAME
echo "================================================= "
echo
echo
echo "================================================"
echo username is $USERNAME and password is $PASSWORD
echo "================================================"
fi
fi
