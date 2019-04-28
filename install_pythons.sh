sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

easy_install pip
pip install --upgrade pip
brew install pyenv pyenv-virtualenv
pyenv install 2.7.16
pyenv install 3.7.3
pyenv virtualenv 2.7.16 neovim2
pyenv virtualenv 3.7.3 neovim3
