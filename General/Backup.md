# Termux Backup Guide

## Data Backup
```sh
# Backup home directory
tar -zcf ~/storage/downloads/termux-backup.tar.gz -C /data/data/com.termux/files ./home

# Backup packages list
pkg list-installed > ~/storage/downloads/pkg-list.txt
```

## Package Backup
```sh
# Create backup script
cat > ~/backup-pkg.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash
pkg list-installed | cut -d "/" -f 1 > ~/storage/downloads/pkglist.txt
EOF

chmod +x ~/backup-pkg.sh
```

## Restore Instructions
```sh
# Restore home directory
tar -zxf ~/storage/downloads/termux-backup.tar.gz -C /data/data/com.termux/files

# Restore packages
cat ~/storage/downloads/pkglist.txt | xargs pkg install
```
