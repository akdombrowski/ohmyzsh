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
    echo "Initializing new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' >"$SSH_AGENT_ENV"
    echo succeeded
    chmod 600 "$SSH_AGENT_ENV"
    . "$SSH_AGENT_ENV" >/dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
CURR_SSH_AGENT_ENV=$(cat "$HOME/.ssh/agent-env" 2>/dev/null)
export CURR_SSH_AGENT_ENV

# Source SSH settings, if applicable
if [ -f "$SSH_AGENT_ENV" ]; then
    . "$SSH_AGENT_ENV" >/dev/null
    # echo "ps -ef | grep \"$SSH_AGENT_PID\" | grep ssh-agent$"
    #ps $SSH_AGENT_PID doesn't work under Cygwin
    ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent$ >/dev/null || {
        start_agent
    }
else
    start_agent
fi
