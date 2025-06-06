# Personal NixOS Configuration

## Initial Setup

Setup *should* be painless. Feel free to install NixOS headless.

1. Clone this repository (`nix run --extra-experimental-features 'nix-command flakes' nixpkgs#git -- clone https://github.com/NotAYoutuberYT/nixos`)
1. Create a new host as needed (copy a pre-existing host, move hardware-configuration into new host, edit configuration.nix and home.nix, etc.)
1. Rebuild and reboot (`sudo nixos-rebuild boot --flake /path/to/flake#hostname`)
1. Sync secrets, logins, and such (sops-nix keys is a good starting point)

## TODO

- write configurations for homelab machines
- give everything a sanity check (this involves going through EVERYTHING)
- improve modularity
    - make things such as notification daemons, terminals, editors, compositors, and shells a bit more modular
    - it should be trivial to swap between sway/hyprland, alacritty/kitty, etc.
    - this probably involves making one or more "options" modules which just defines global options (i.e. default terminal or file manager)
- get a proper widget system (ewww or astal, depends on how much I value performance)
- allow for multiple users (remember to allow stylix overrides!)
