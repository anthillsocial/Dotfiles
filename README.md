myconfig
========

My configeration file for vim (and possibly others in the future) to 
enable easy switching between machines. I simply create a sym link
to the myconfig directory in order to start using this config on any 
machine I am logged into:
  $ ln -s myconfig/.vimrc .vimrc
  $ ln -s myconfig/.vim .vim

I use pathogen to mange vim plugins where "any plugins you wish to
install can be extracted to a subdirectory under ~/myconfig/.vim/bundle, 
and they will be added to the 'runtimepath'" i.e:

	cd ~/myconfig/.vim/bundle
	git clone git://github.com/tpope/vim-sensible.git
