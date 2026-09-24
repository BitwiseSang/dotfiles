function emacs-daemon-restart --wraps='systemctl --user restart emacs.service' --description 'alias emacs-restart=systemctl --user restart emacs.service'
    systemctl --user restart emacs.service $argv
end
