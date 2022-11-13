###
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode disabled  # disable automatic updates
HIST_STAMPS="dd/mm/yyyy"
plugins=(ansiweather
extract
fzf-tab
git
git-extras
you-should-use
zfzf
zsh-autosuggestions
zsh-completions
zsh-navigation-tools
catppuccin-zsh-syntax-highlighting
zsh-syntax-highlighting
history-substring-search)

source $ZSH/oh-my-zsh.sh

export LANG=es_ES.UTF-8


if [[ -f $HOME/.config/zsh_config/zsh_if ]]; then
         source  $HOME/.config/zsh_config/zsh_if
fi

autoload -U bashcompinit
    bashcompinit
