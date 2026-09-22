function dcl --wraps='docker system prune --all --volumes --force' --description 'alias dcl=docker system prune --all --volumes --force'
    docker system prune --all --volumes --force $argv
end
