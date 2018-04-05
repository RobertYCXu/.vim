# Personal vim config
## Installation
```
cd ~
rm -rf .vim
rm .vimrc
git clone https://github.com/RobertYCXu/vim-config .vim
# link .vimrc with vimrc in .vim
ln -s ~/.vim/vimrc ~/.vimrc
```
## Dependencies
*1. Powerline fonts*
```
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
```
Then change iterm font to a powerline font.
