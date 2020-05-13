# Personal dotfiles

Using [HN comment](https://news.ycombinator.com/item?id=11070797).

* To replicate on a new machine

```shell
git clone --single-branch --depth 1 --separate-git-dir=~/.dotfiles https://github.com/wjes/dotfiles.git ~/tmp
cp -a ~/tmp/. ~
rm -r ~/tmp
```

* Install `bash_it`

```shell
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --no-modify-config
```
