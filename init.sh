#!/bin/zsh

echo -e "
Some commands require elevated privileges to run unattended.
A basic sudo call will be made now so that you're not prompted again later in the script."

sudo echo "sudo authorized!"

# install iTerm2
curl "https://iterm2.com/downloads/stable/iTerm2-3_4_19.zip" -o ~/Downloads/iTerm2.zip
unzip ~/Downloads/iTerm2.zip -d /Applications

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install AWS CLI

curl -L "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o ~/Downloads/AWSCLIV2.pkg
sudo installer -pkg ~/Downloads/AWSCLIV2.pkg -target /

# install VS Code
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=darwin-arm64" -o ~/Downloads/VSCode.zip
unzip ~/Downloads/VSCode.zip -d /Applications

# install Docker if it's not already

 sudo hdiutil attach Docker.dmg && echo "Install image mounted."
 sudo /Volumes/Docker/Docker.app/Contents/MacOS/install \
  --accept-license \

 sudo hdiutil detach /Volumes/Docker

# Generic
brew install \
  gnupg \
  gh \
  jq \
  yq \
  pre-commit \
  direnv

# Languages and their package managers
brew install node@19.6 \
  yarn \
  python@3.10 \
  poetry \
  ruby@2.7 \
  rbenv \
  golang@1.19
  
# Infra and config management
brew install kubectl \
  kubectx \
  kube-ps1 \
  terraform \
  tfenv \
  argocd \
  serverless@3 \

# Persistent storage & cache
brew install posgresql@14 \
  redis@6 \
  memcached@1.6
  

# Stuff I like
brew install bitwarden #

# Stuff that needs cask option
brew install --cask spotify

# push fonts
cp -r ./fonts/* ~/Library/Fonts/.

# push zshrc
cat zshrc >> ~/.zshrc

# Push vscode settings
mkdir -p ~/.vscode
cp vscode/settings.json ~/.vscode/
