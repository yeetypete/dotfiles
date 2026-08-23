if not status is-interactive
    return
end

if not type -q zoxide
    return
end

zoxide init fish | source

# Wrap z to prefer matches inside the current git worktree
function z --description "zoxide with worktree-local preference"
    if test (count $argv) -eq 0
        __zoxide_z
        return
    end

    set -l wt_root (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$wt_root"
        set -l cur (__zoxide_pwd)
        for line in (zoxide query --list -- $argv 2>/dev/null)
            test "$line" = "$cur"; and continue
            if string match -q "$wt_root/*" -- $line; or test "$line" = "$wt_root"
                __zoxide_cd "$line"
                return
            end
        end
    end

    __zoxide_z $argv
end
