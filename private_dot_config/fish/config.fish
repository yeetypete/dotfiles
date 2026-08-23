if status is-interactive
    # Commands to run in interactive sessions can go here

    if type -q direnv
        direnv hook fish | source
    end
    if type -q task
        task --completion fish | source
    end
    if type -q uv
        uv generate-shell-completion fish | source
    end
    if type -q uvx
        uvx --generate-shell-completion fish | source
    end
    if type -q chezmoi
        chezmoi completion fish | source
    end
    if type -q fzf
        fzf --fish | source
    end
end

set fish_greeting

fish_add_path $HOME/.local/bin

if type -q go
    set -x GOPATH $HOME/go
    fish_add_path $GOPATH/bin
end

# tailscale
alias tsw="sudo tailscale switch work"
alias tsp="sudo tailscale switch personal"

if not set -q SSH_CONNECTION
    set -x SSH_AUTH_SOCK ~/.1password/agent.sock
end

function fzf_tailscale_nodes
    set node (tailscale status | awk '!/^#/ && $2 != "" {print $2}' | fzf --layout=reverse)
    if test -n "$node"
        commandline -i "$node"
    end
end
bind \cs fzf_tailscale_nodes

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

if type -q starship
  starship init fish | source
end
