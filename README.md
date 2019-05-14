# Personal dotfiles

Based on [HN comment](https://news.ycombinator.com/item?id=11070797).

```shell
# In your bashrc
alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```
* To replicate on a new machine

```shell
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/ee7git/dotfiles.git $HOME/tmp
rm -r ~/tmp
```
