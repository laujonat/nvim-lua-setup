# Used on Intel Macs
# Disable default terminal control flow (interferes with vim mappings)
stty -ixon
# Autoload compinit and promptinit
autoload -Uz compinit promptinit

# Use brew to install brew install antidote
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh

antidote load

bindkey -r '\C-s'
stty -ixon

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load private zsh configurations
if [[ -f ~/.zsh_private ]]; then
	source ~/.zsh_private
fi

# Update PATH
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"


export TERM=xterm

bindkey '^[[A' autosuggest-accept
bindkey '^[[B' autosuggest-accept

. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
compinit

source $HOME/.zsh_personal

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

alias vim='neovide'

