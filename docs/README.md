## Gists

### System Debugging

Check if any of the system services failed to start:

```shell
sudo systemctl --failed
```

### File Permissions

Set restricted permissions for files and directories:

```shell
# Find all directories in desired path and set 755 permission
find <path> -type d -exec chmod 755 {} +

# Find all files in desired path and grant only file creator write privs
find <path> -type f -exec chmod 644 {} +
```

### Syncing Data

Sync two directories locally:

```shell
# Backup home directory to mounted external drive
rsync -avzh --delete /path/to/directory /mnt/backup/
```

### Search and Replace

```shell
find . -type f -exec sed -i 's/OLD/NEW/g' {} +
```

### Drive Encryption

Encrypt drive partition with luks via [Average Linux User](https://www.youtube.com/watch?v=ch-wzDyo-wU) or [encrypt-drive](./help/guides/encrypt-drive.txt).


### Package Management

Remove unused packages and configurations (orphans) with paru:

```shell
paru --clean
```
Export installed packages in system:

```shell
paru -Qqen > pkglist.txt
paru -Qqem > pkglist-aur.txt
```

Add color to pacman by editing `/etc/pacman.conf`:

```shell
# /etc/pacman.conf
COLOR
```

Update global NPM packages:

```shell
npx npm-check-updates -g
```

### Mudita Center Setup

Install dependencies:

```shell
paru -S fuse2 mudita-center-appimage
```

Need to first make your user a member of the dialout group and log out and back in:

```shell
sudo groupadd dialout
sudo usermod -a -G dialout $USER
logout
```

Then you will want to plugin your phone via USB-C and change the permission for the device:

```shell
sudo chmod a+rw /dev/ttyACM0
```

Now launch the app with `mudita-center`.
