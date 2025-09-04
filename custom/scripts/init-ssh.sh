#!/usr/bin/env bash

# #######################################
# #      ######   ######  ##     ##     #
# #     ##    ## ##    ## ##     ##     #
# #     ##       ##       ##     ##     #
# #      ######   ######  #########     #
# #           ##       ## ##     ##     #
# #     ##    ## ##    ## ##     ##     #
# #      ######   ######  ##     ##     #
# #######################################
export DEEBUG=true
export SSH_AGENT_ENV="$HOME/.ssh/agent-env"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"$SSH_AGENT_ENV"
    echo succeeded
    chmod 600 "$SSH_AGENT_ENV"
    . "$SSH_AGENT_ENV" >/dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "$SSH_AGENT_ENV" ]; then
    . "$SSH_AGENT_ENV" >/dev/null
    #ps $SSH_AGENT_PID doesn't work under Cygwin
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent$ >/dev/null || {
        start_agent
    }
else
    start_agent
fi