# Dotfiles

**Warning:** Use at your own risk. I currently am using [manjaro-i3](https://manjaro.org/downloads/community/i3/) distro. So the files are made to work with arch based systems. Many of the configurations like `alacritty.yml` or `.Xresources` should work regardless of your distribution.

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
