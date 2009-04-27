#!/bin/bash
# dot.dircolors
# dot.gvimrc
pwd=`pwd`
echo ${pwd}
if [ -e $HOME/.vimperatorrc ]
  then rm -i $HOME/.vimperatorrc
fi
if [ -L $HOME/.vimperatorrc ]
  then rm -i $HOME/.vimperatorrc
fi
ln -s ${pwd}/dot.vimperatorrc $HOME/.vimperatorrc

if [ -e $HOME/.vimrc ]
  then rm -i $HOME/.vimrc
fi
if [ -L $HOME/.vimrc ]
  then rm -i $HOME/.vimrc
fi
ln -s ${pwd}/dot.vimrc $HOME/.vimrc

# dot.zshenv
if [ -e $HOME/.zshrc ]
  then rm -i $HOME/.zshrc
fi
if [ -L $HOME/.zshrc ]
  then rm -i $HOME/.zshrc
fi
ln -s ${pwd}/dot.zshrc $HOME/.zshrc

exit 0
