echo *********************;
echo configuring python;
echo *********************;
brew install pyenv;
export PYTHON_CONFIGURE_OPTS="--enable-framework";
pyenv install 3.8.10;
pyenv global 3.8.10;
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc;


echo *********************;
echo installing libraries from brew;
echo *********************;
brew install cmake mono go nodejs;
brew install cmake python mono go nodejs;
brew upgrade;
brew cleanup;

echo *********************;
echo configuring vim;
echo *********************;
brew install vim;
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;
cp .vimsrc ~/.vimrc
source ~/.vimrc
vim +'PlugInstall --sync' +qa;
python3 ~/.vim/plugged/youcompleteme/install.py --all;
mkdir ~/.vim/undodir;








