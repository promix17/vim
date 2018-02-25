cp .vimrc ~/.vimrc
cp .vim ~/ -R
cd .vim
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
cd ~
