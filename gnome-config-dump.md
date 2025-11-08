# Dump and import gnome-settings 

To Export 
```sh
dconf dump / > gnome-settings-backup.dconf
```

only keyboard shortcuts?
```sh
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > custom-shortcuts.dconf
```

window management ?
```sh
dconf dump /org/gnome/desktop/wm/keybindings/ > wm-keybindings.dconf
```

To import
```sh
dconf load / < gnome-settings-backup.dconf
```
