function dcubd --wraps='docker compose up -d --build' --description 'alias dcubd=docker compose up -d --build'
    docker compose up -d --build $argv
end
