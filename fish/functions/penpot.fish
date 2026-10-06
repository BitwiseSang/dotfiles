function penpot --wraps='docker compose -p penpot -f docker-compose.yaml up -d' --wraps='docker compose --project-name penpot --file ~/penpot/docker-compose.yaml up -d' --wraps='docker compose --project-name penpot --file ~/penpot/docker-compose.yaml up --detach' --description 'alias penpot=docker compose --project-name penpot --file ~/penpot/docker-compose.yaml up --detach'
    docker compose --project-name penpot --file ~/penpot/docker-compose.yaml up --detach $argv
end
