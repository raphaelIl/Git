# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# For Dev
export VSCODE="/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# export GOPATH="$HOME/Desktop/GoProjects/go1.18.8"
export GOPATH="$HOME/.GoProjects/go1.19.5"
export KREW="$HOME/.krew/bin"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

eval "$(jenv init -)"

# On WSL
# export VSCODE='/mnt/c/Program Files/Microsoft VS Code/bin'
# export IDEA='/mnt/c/Program Files/JetBrains/IntelliJ IDEA 2021.2.1/bin'

# If you come from bash you might have to change your $PATH.
# add PATH, $GOPATH, vsCode intellij
# export GOBIN16="$GOPATH/go1.16.15/bin"
export PATH="$PATH:$KREW:$HOME/bin:$VSCODE:$GOPATH/bin:"
ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="dracula"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random editor cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf
  fasd
  asdf
  kubectl # kubectx
  kube-ps1
)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ll='ls -alh'
alias ksr='k --sort-by=.metadata.creationTimestamp'
alias kn='k neat'
# kubectl-slice -f cert-manager.yaml -t "{{.kind}}.yaml" -o cert-manager
alias ks='kubectl-slice'
alias e='exit'
alias c='clear'
alias tf='terraform'
alias saml='saml2aws login --force --skip-prompt --mfa-token=$1'
# export KUBE_EDITOR=/opt/homebrew/bin/code

# AutoComplete argo-rollout
source <(kubectl-argo-rollouts completion zsh)

alias kar='kubectl-argo-rollouts'
# alias cat='bat'

# kubebuilder autocompletion
# source <(kubebuilder completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

## terraform
# eval "$(terraform -install-autocomplete)"
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

## kubectl
# custom diff
export KUBECTL_EXTERNAL_DIFF="colordiff -N -u" # brew install colordiff
export KUBE_EDITOR=/usr/bin/vim
PROMPT='$(kube_ps1)'$PROMPT # or RPROMPT='$(kube_ps1)'

# Resolve the real kubectl binary once
KUBECTL_BIN="${KUBECTL_BIN:-$(command -v kubectl)}"

# Wrapper: prompt when user runs kubectl directly in interactive shell
kubectl() {
  # If bypass flag is set (e.g., called from kapply/kdelete), run real kubectl quietly
  if [ -n "${KUBECTL_WRAPPER_BYPASS:-}" ]; then
    command "$KUBECTL_BIN" "$@"
    return $?
  fi

  if [ "$1" = "__complete" ] || [ -n "${COMP_LINE:-}" ]; then
    command "$KUBECTL_BIN" "$@"; return $?
  fi

  echo -e "\033[31m[WARNING]\033[0m You are running kubectl directly."
  echo -e "\033[33mRecommended: use kapply / kdelete instead.\033[0m"
  echo -n -e "\033[32mAre you sure you want to run kubectl? (y/N): \033[0m"
  read -r confirm
  case "$confirm" in
    y|Y)
      command "$KUBECTL_BIN" "$@"
      ;;
    *)
      echo -e "\033[31mAborted.\033[0m"
      return 1
      ;;
  esac
}

kapply() {
  if [ -z "$1" ]; then
    echo -e "\033[31mUsage: kapply [-f <file> | -k <kustomization-dir>]\033[0m"
    return 1
  fi

  # Use bypass to avoid wrapper prompt
  diff_output=$(KUBECTL_WRAPPER_BYPASS=1 "$KUBECTL_BIN" diff "$@" 2>&1)
  diff_status=$?

  # Interpret kubectl diff exit codes:
  # 0 => no differences; 1 => differences found; >1 => error
  if [ $diff_status -eq 0 ] && [ -z "$diff_output" ]; then
    echo -e "\033[32mNo changes found. Nothing to apply.\033[0m"
    return 0
  elif [ $diff_status -gt 1 ]; then
    echo -e "\033[31mError running 'kubectl diff'. See details below:\033[0m"
    echo "$diff_output"
    return $diff_status
  fi

  echo "$diff_output"
  echo -e "\033[33m----------------------------------------\033[0m"
  echo -e "\033[33mDiff checking complete\033[0m"
  echo -e "\033[33m----------------------------------------\033[0m"

  echo -n -e "\033[32mApply changes? (y/N): \033[0m"
  read -r confirm
  case "$confirm" in
    y|Y)
      KUBECTL_WRAPPER_BYPASS=1 "$KUBECTL_BIN" apply "$@"
      ;;
    *)
      echo -e "\033[31mAborted.\033[0m"
      return 1
      ;;
  esac
}

kdelete() {
  if [ -z "$1" ]; then
    echo -e "\033[31mUsage: kdelete [-f <file> | -k <kustomization-dir> | <type[/name]> ...]\033[0m"
    return 1
  fi

  # Identify exact targets via dry-run (no real deletion)
  targets_text=$(KUBECTL_WRAPPER_BYPASS=1 "$KUBECTL_BIN" delete "$@" \
    --dry-run=client -o name --ignore-not-found=true 2>&1)
  rc=$?

  if [ $rc -gt 0 ]; then
    echo -e "\033[31mError preparing delete preview. See details below:\033[0m"
    echo "$targets_text"
    return $rc
  fi

  if [ -z "$targets_text" ]; then
    echo -e "\033[32mNo matching resources found. Nothing to delete.\033[0m"
    return 0
  fi

  # Convert list to array (portable: bash/zsh)
  targets=()
  while IFS= read -r line; do
    [ -n "$line" ] && targets+=("$line")
  done <<EOF
$(printf '%s\n' "$targets_text" | sed '/^\s*$/d')
EOF

  echo -e "\033[33mThe following resources will be deleted:\033[0m"

  # Readable preview (wide first, fallback to names)
  if ! KUBECTL_WRAPPER_BYPASS=1 "$KUBECTL_BIN" get "${targets[@]}" -o wide 2>/dev/null; then
    printf '%s\n' "${targets[@]}"
  fi

  echo -e "\033[33m----------------------------------------\033[0m"
  echo -e "\033[33mDelete preview complete\033[0m"
  echo -e "\033[33m----------------------------------------\033[0m"

  # Confirmation (y/Y only → execute)
  echo -n -e "\033[32mDelete resources? (y/N): \033[0m"
  read -r confirm
  case "$confirm" in
    y|Y)
      KUBECTL_WRAPPER_BYPASS=1 "$KUBECTL_BIN" delete "$@"
      ;;
    *)
      echo -e "\033[31mAborted.\033[0m"
      return 1
      ;;
  esac
}

# https://istio.io/latest/docs/ops/diagnostic-tools/istioctl/#istioctl-auto-completion
# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

#   autoload -Uz compinit
#   compinit
# fi

# Get the aliases and functions for Kurly Kubernetes Config
# [[ ! -f ~/.zshrc.kurly ]] || source ~/.zshrc.kurly

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/raphael/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
