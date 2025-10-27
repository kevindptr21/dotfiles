# dotfiles

My dotfile configuration for consistent computing experience across multiple machine.

### Prerequisite

1. [zoxide](https://github.com/ajeetdsouza/zoxide)
2. [starship](https://starship.rs/)
3. [fzf](https://github.com/junegunn/fzf)
4. [tmux](https://github.com/tmux/tmux/wiki/Getting-Started)
5. [tpm](https://github.com/tmux-plugins/tpm)

I manage the various configuration files in this repo using [GNU Stow](https://www.gnu.org/software/stow/). This allows me to set up symlinks for all of my dotfiles using a single command:

```bash
stow .
```

after finish the installation and the config was symlinked, run tmux and do command:

```bash
ctrl+a shift+i
```

for installing tmux plugin
