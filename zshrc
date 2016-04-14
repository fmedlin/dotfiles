export VISUAL="/usr/local/bin/atom -w"
export EDITOR=$VISUAL

# Path to your oh-my-zsh installation.
export ZSH=/Users/fred/.oh-my-zsh
plugins=(adb)
export DISABLE_AUTO_UPDATE="true"
export ZSH_THEME="fmedlin"
source $ZSH/oh-my-zsh.sh

for zsh_source in $HOME/.zsh/config/*.zsh; do
  source $zsh_source
done

export ANDROID_HOME=~/Library/Android/sdk
export ANDROID_KEY_BASE=~/
export ANDROID_TOOLS=$ANDROID_HOME/tools
export ANDROID_PLATFORM_TOOLS=$ANDROID_HOME/platform-tools

export PATH="/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_TOOLS:$ANDROID_NDK

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
