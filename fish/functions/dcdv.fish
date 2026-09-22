function dcdv --wraps='docker compose down --volumes' --description 'alias dcdv=docker compose down --volumes'
    docker compose down --volumes $argv
end
