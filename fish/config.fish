source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
    # smth smth
end
starship init fish | source

# zoxide (smart cd)
if type -q zoxide
    zoxide init fish | source
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# deno
set -gx DENO_INSTALL "$HOME/.deno"
fish_add_path "$DENO_INSTALL/bin"

# pnpm
set -gx PNPM_HOME "/home/cicada3301/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by Antigravity CLI installer
set -gx PATH "/home/cicada3301/.local/bin" $PATH

# Set up gpg for fish
set -gx GPG_TTY (tty)

# Refresh gpg-agent tty info on new shell sessions
gpg-connect-agent updatesstartuptty /bye >/dev/null
mise activate fish | source
