## This is all the stuff I created after OhMyZSH did it's thing
## after running init.sh, copy this bit into .zshrc because I don't really feel
## like writing some rediculous sed/regex to do it
#plugins=(git python terraform ruby rails node kubernetes)
zplugin light jonmosco/kube-ps1

eval "$(direnv hook zsh)"
fpath=($fpath ~/.zsh/completion)

# My custom aliases and functions

function lsearch {
  # usage example: lsearch ~/wave/src keller
  SEARCH_PATH=$1
  SEARCH_STR=$2

  RESULT=$(find ${SEARCH_PATH} -name "*${SEARCH_STR}*" -depth 1)
  echo $RESULT
  RESULT_COUNT=$(echo $RESULT | wc -l)

  if [[ $RESULT_COUNT -gt 1 ]] ; then
    echo "Returned more than one result, please narrow your search:"
    echo $RESULT
  elif [[ $RESULT_COUNT -eq 0 ]] ; then
    echo "No result found, please try again."
  else
    cd $RESULT
  fi
}

function repos {
  cd ~/repos/${1}
}

# Check if primary SSH identity is stored, if not, add it

# Function to connect to the VPN from command line

#function vpn {
#  CHK_STATE=$(osascript \
#  -e "tell application \"/Applications/Tunnelblick.app\"" \
#  -e "get state of configurations" \
#  -e "end tell")
#
#  if [[ "$1" = "on" ]]
#    then if [[ "$CHK_STATE" = "CONNECTED" ]]
#      then echo "Already connected"
#      else echo "Connecting to VPN..."
#      osascript \
#	-e "tell application \"/Applications/Tunnelblick.app\"" \
#        -e "connect \"wave-vpn\"" \
#        -e "end tell"
#      echo "Waiting 60 seconds for routing update..."
#      sleep 60
#    fi
#  elif [[ "$1" = "off" ]]
#    then if [[ "$CHK_STATE" = "CONNECTED" ]] 
#      then echo "Disconnecting the VPN..."
#      osascript \
#      -e "tell application \"/Applications/Tunnelblick.app\"" \
#      -e "disconnect \"wave-vpn\"" \
#      -e "end tell"
#      else echo "VPN Already disconnected"
#    fi
#  else echo "Command not recognized"
#  fi
#}

# Open a browser to the repo page in Github
function ghr {
  local REMOTE_URL=$(git config --get remote.origin.url | sed s'_\.git_/_' | tr : / | sed 's_git@_https://_')
  open $REMOTE_URL
}

function switch_main {

	git branch -m master main
	git fetch origin
	git branch -u origin/main main
	git remote set-head origin -a

}

function date_prompt {
	date +%Y-%M-%d@%H:%M:%S
}

function gcempty {
	git commit --allow-empty -m "empty"
}

export PATH="$HOME/.poetry/bin:$PATH"

source "/opt/homebrew/share/kube-ps1.sh"
PS1="$(kube_ps1)\n"$PS1
PS1='$(date_prompt)'$PS1
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export GOPATH="$HOME/go"

## Workaround for AWS CLI v2 ignoring region config in creds file
export AWS_DEFAULT_REGION=us-east-1

## Local/user executables
export PATH=$PATH:$HOME/.bin
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

# Enable the krew plugin for kubectl
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Required for NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
