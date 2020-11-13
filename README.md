# Dotfiles

**Warning:** Use at your own risk. This repository is adapted to work with arch + i3 WM.

# Gists

## File System

### Permissions

Set restricted permissions for files and directories:

```bash
# Find all directories in home directory and set 755 permission
$ find $HOME -type d -exec chmod 755 {} +

# Find all files in home directory and grant only file creator write privs
$ find $HOME -type f -exec chmod 644 {} +
```

### Syncing

Sync two directories locally:

```bash
# Backup home directory to mounted external drive
rsync -avzh $HOME /mnt/backup/
```
