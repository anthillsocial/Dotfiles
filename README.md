Linux Helpers
=============

Scripts
-------------
A collection of scripts I use for general maintance or running of a number of Linux boxes I use.

Dotfiles
-------------

My configeration files for Arch Linux to enable easy switching between machines. I simply create a symlink
to the myconfig directory in order to start using this config on any 
machine I am logged into:
  $ ln -s myconfig/.vimrc .vimrc
  $ ln -s myconfig/.vim .vim

I use pathogen to mange vim plugins where "any plugins you wish to
install can be extracted to a subdirectory under ~/myconfig/.vim/bundle, 
and they will be added to the 'runtimepath'" i.e:

	cd ~/myconfig/.vim/bundle
	git clone git://github.com/tpope/vim-sensible.git
	
I also use the cinnamon desktop.
