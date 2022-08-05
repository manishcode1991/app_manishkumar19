#!/bin/bash


YELLOW="\e[0;93m"
GREEN="\e[0;92m"
BOLD="\e[1m"
RESET="\e[0m"

step()    { echo -e "${YELLOW}${BOLD}===> ${RESET}${*}${RESET}"; }
success() { echo -e "${RESET}${GREEN}${BOLD}${*}${RESET}"; }

# Activate virtual environment

source /appenv/bin/activate



# In Prod, this may be configured with a GID already matching the container
# allowing the container to be run directly as Jenkins. In Dev, or on unknown
# environments, run the container as root to automatically correct docker
# group in container to match the docker.sock GID mounted from the host.


if [ "$(id -u)" = "0" ]; then

    DOCKER_SOCKET=/var/run/docker.sock
    DOCKER_GROUP=docker

    if [[ -S ${DOCKER_SOCKET} ]]; then
        DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})
        groupadd -for -g ${DOCKER_GID} ${DOCKER_GROUP}
        usermod -aG ${DOCKER_GROUP} app
        step "Docker setup $(success [Done])"
    else
        step "Docker setup $(success [OK])"
    fi

  # Add call to gosu to drop from root user to app user
  # when running original entrypoint

fi


chown app.app -R /appenv
chown app.app -R /application
chown app.app -R /home

gosu app pip install -r requirements.txt --exists-action=i


#set -- gosu app "$@"

step "Running: $@"

exec $@