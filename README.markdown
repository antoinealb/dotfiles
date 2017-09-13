# Installing Oh-my-fish
 ```bash
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
```

# Set of config files

Where should you link your stuff ?

```sh
ln -s ~/dotfiles/config.fish ~/.config/omf/init.fish
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/amethyst.json .amethyst
ln -s ~/dotfiles/xmonad.hs ~/.xmonad/xmonad.hs
```

## Disabling SSH locale forwarding in OSX
Locale forwarding is really annoying because most Linux machines don't have the same locale names as OSX.
To fix this simply comment the relevant `SendEnv` line in `/etc/ssh_config`, like this:

```
Host *
#   SendEnv LANG LC_*
```
