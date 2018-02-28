cp .vimrc ~/.vimrc
cp .vim ~/ -R
cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t && ruby extconf.rb && make
cd ~
