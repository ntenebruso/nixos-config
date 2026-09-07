#!/usr/bin/env bash

bwrap \
    --ro-bind /nix /nix \
    --ro-bind /etc /etc \
    --ro-bind /run /run \
    --ro-bind "$HOME/.nix-profile" "$HOME/.nix-profile" \
    --proc /proc \
    --dev /dev \
    --tmpfs /tmp \
    --bind "$HOME/.cache/opencode" "$HOME/.cache/opencode" \
    --bind "$HOME/.config/opencode" "$HOME/.config/opencode" \
    --bind "$HOME/.local/share/opencode" "$HOME/.local/share/opencode" \
    --bind "$HOME/.local/state/opencode" "$HOME/.local/state/opencode" \
    --bind "$PWD" "$PWD" \
    --chdir "$PWD" \
    --unshare-all \
    --share-net \
    --new-session \
    --die-with-parent \
    opencode "$@"
