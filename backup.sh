#!/bin/bash

# Prompt user for source file path
read -p "Enter the full path of the file to backup: " source_file

# Check if source file exists
if [ ! -e "$source_file" ]; then
    echo "Source file does not exist. Backup aborted."
    exit 1
fi

# Prompt user for backup directory
read -p "Enter the full path of the backup directory: " backup_dir

# Create backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
    read -p "Backup directory does not exist. Do you want to create it? (y/n): " create_backup_dir
    if [ "$create_backup_dir" = "y" ]; then
        mkdir -p "$backup_dir"
        if [ $? -ne 0 ]; then
            echo "Failed to create backup directory: $backup_dir"
            exit 1
        fi
    else
        echo "Backup aborted."
        exit 1
    fi
fi

# Create backup
archive_file="backup_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"
echo "Proceeding with backup of $source_file to $backup_dir"
tar -czvf "$backup_dir/$archive_file" -C "$(dirname "$source_file")" "$(basename "$source_file")"
echo "Backup completed: $archive_file"

# Optional: Remove old backups
read -p "Do you want to remove old backups in $backup_dir? (y/n): " remove_old_backups
if [ "$remove_old_backups" = "y" ]; then
    find "$backup_dir" -name 'backup_*.tar.gz' -mtime +7 -exec rm {} \;
fi
