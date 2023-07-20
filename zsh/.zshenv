# ~/ cleanup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_BIN_HOME="$HOME/.local/bin"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export FEHBG_PATH="$XDG_CONFIG_HOME/fehbg"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export N_PREFIX="$XDG_DATA_HOME/n"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export ANSIBLE_HOME="$XDG_CONFIG_HOME/ansible"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="$XDG_CACHE_HOME/ansible/galaxy_cache"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export DOPPLER_CONFIG_DIR="$XDG_CONFIG_HOME/doppler"
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME/aws/credentials"
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME/aws/config"

# ~/ cleanup - PATH updates
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
[[ :$PATH: == *":$CARGO_HOME/bin:"* ]] || PATH+=":$CARGO_HOME/bin"
[[ :$PATH: == *":$XDG_DATA_HOME/bin:"* ]] || PATH+=":$XDG_DATA_HOME/bin"
[[ :$PATH: == *":$XDG_BIN_HOME:"* ]] || PATH+=":$XDG_BIN_HOME"
[[ :$PATH: == *":$XDG_BIN_HOME/statusbar:"* ]] || PATH+=":$XDG_BIN_HOME/statusbar"



# misc environment varables
export TERMINAL="st"
