function emacs-daemon --wraps='systemctl --user enable --now emacs' --description 'alias emacs-daemon=systemctl --user enable --now emacs'
    systemctl --user enable --now emacs $argv
end
