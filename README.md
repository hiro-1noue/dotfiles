# dotfiles

NixOS flake and Home Manager configuration for `hiro@nixos`.

## Layout

```text
.
├── flake.nix
├── nixos/
│   └── hosts/
│       └── nixos/
│           ├── configuration.nix
│           └── hardware-configuration.nix
├── home/
│   └── home.nix
└── config/
```

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
git add flake.nix nixos home flake.lock README.md config .gitignore
git commit -m "Manage user environment with Home Manager"
git push origin main
```
