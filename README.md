# dotfiles

NixOS flake and Home Manager configuration for `hiro@nixos`.

## Apply

```sh
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

## Update inputs

```sh
nix flake update /etc/nixos
sudo nixos-rebuild switch --flake /etc/nixos#nixos
```

## Git workflow

```sh
git status
git add flake.nix home.nix configuration.nix hardware-configuration.nix flake.lock README.md
git commit -m "Manage user environment with Home Manager"
git push origin main
```
