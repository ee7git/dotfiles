# Setup fzf
# ---------
if [[ ! "$PATH" == */home/warren/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/warren/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/warren/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/warren/.fzf/shell/key-bindings.bash"
