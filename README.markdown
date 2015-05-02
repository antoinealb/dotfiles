# Set of config files

Where should you link your stuff ?

```sh
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
```

## Disabling SSH locale forwarding in OSS
Locale forwarding is really annoying because most Linux machines don't have the same locale names as OSX.
To fix this simply comment the relevant `SendEnv` line in `/etc/ssh_config`, like this:

```
Host *
#   SendEnv LANG LC_*
```
