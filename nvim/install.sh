# install vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim
cp ./plugins.vim ~/.config/nvim 
echo "so ~/.config/nvim/plugins.vim" > ~/.config/nvim/init.vim
nvim +PlugInstall +qa
cp -r ./* ~/.config/nvim

