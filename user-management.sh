#!/bin/bash

#add a user
add_user() {
    read -p "Enter username: " username
    read -p "Enter password: " password
    useradd -m -p "$password" $username
}

#delete an user
delete_user() {
    read -p "Enter username to delete: " username
    userdel -r $username
}

#change password
change_password() {
    read -p "Enter username to modify: " username
    read -p "Enter new password: " password
    if [ -n "$password" ]; then
        usermod -p "$password" $username
    fi
}

#create a backup
backup() {
    read -p "Enter directory to backup: " directory
    timestamp=$(date +%Y%m%d_%H%M%S)
    tar -czvf backup_$timestamp.tar.gz $directory
}

#main function
while true; do
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. Change Password"
    echo "4. Backup Directory"
    echo "5. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) change_password ;;
        4) backup ;;
        5) exit 0 ;;
        *) echo "Invalid choice" ;;
    esac
done
