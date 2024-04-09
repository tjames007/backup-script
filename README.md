Backup your files with this interactive backup script for Linux... or, make it better! -Teamwork makes the dreamwork

# Backup Script

This Bash script allows you to create backups of files or directories.

## How to Use

1. **Run the Script**: Execute the script in your terminal.
2. **Enter Source File Path**: You'll be prompted to enter the full path of the file or directory you want to back up.
3. **Check Source File**: The script checks if the specified source file exists. If it doesn't exist, the backup process is aborted.
4. **Enter Backup Directory**: Enter the full path of the directory where you want to store the backup.
5. **Create Backup Directory**: If the specified backup directory doesn't exist, you'll be prompted to create it. Choose 'y' to create the directory or 'n' to abort the backup process.
6. **Backup Creation**: The script creates a backup archive with a timestamp in the backup directory using `tar`.
7. **Confirmation**: Once the backup is completed, you'll receive a confirmation message with the name of the backup archive.
8. **Remove Old Backups (Optional)**: You have the option to remove old backups in the backup directory. Choose 'y' to remove old backups older than 7 days or 'n' to skip this step.

## Notes

- This script creates a compressed tar archive (.tar.gz) of the source file or directory.
- You can customize the backup directory and archive filename format as needed.
- Make sure to review and test the script in your environment before using it for critical backups.
