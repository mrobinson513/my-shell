#!/bin/zsh

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

# Wave's recommended packages

brew install \
  gnupg \
  jq \
  yq \
  pre-commit \
  yarn \
  node \
  argocd \
  python@3.9 \
  poetry \
  ruby@3 \
  rbenv

# My preferred packages

brew install \
  direnv \
  kubectl \
  kubectx \
  kube-ps1 \
  terraform \
  tfenv \
  doctl \
  bitwarden \
  gh

# push zshrc
cat zshrc >> ~/.zshrc

# Push vscode settings
mkdir -p ~/.vscode
cp vscode/settings.json ~/.vscode/
