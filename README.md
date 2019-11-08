# Personal dotfiles

Using [HN comment](https://news.ycombinator.com/item?id=11070797).

* To replicate on a new machine

```shell
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/wjes/dotfiles.git "${HOME}/tmp"
cp -a "${HOME}/tmp/." ~
rm -r "${HOME}/tmp"
```
