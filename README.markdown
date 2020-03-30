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
ln -s ~/dotfiles/gdbinit ~/.gdbinit
```

## Disabling SSH locale forwarding in OSX
Locale forwarding is really annoying because most Linux machines don't have the same locale names as OSX.
To fix this simply comment the relevant `SendEnv` line in `/etc/ssh_config`, like this:

```
Host *
#   SendEnv LANG LC_*
```
# Enabling smartcard support for gpg

1. Install gpg > 2.1 and pinentry-mac
2. Put the following in ~/.gnupg/gpg-agent.conf
3. Put the following in your fish config
4. Restart gpg agent by running `gpg-connect-agent killagent /bye` and `gpg-connect-agent /bye`.

```
# GPG conf
pinentry-program /usr/local/bin/pinentry-mac
enable-ssh-support
```

```
# Fish config
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh

# Bash config
export "GPG_TTY=$(tty)"
export "SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh"
```

# Disabling OSX non breaking spaces

Source: https://superuser.com/questions/78245/how-to-disable-the-option-space-key-combination-for-non-breaking-spaces

Put the following in `~/Library/KeyBindings/DefaultKeyBinding.dict` (need to create the file and directory):

```
{
"~ " = ("insertText:", " ");
}
```
