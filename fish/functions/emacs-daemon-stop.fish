function emacs-daemon-stop --wraps='systemctl --user stop emacs.service' --description 'alias emacs-daemon-stop=systemctl --user stop emacs.service'
    systemctl --user stop emacs.service $argv
end
