
nix is functional programming language

in flakes you define exactly which packages and channel you are using, so everybody has the same stuff

# NIX FLAKES

Add at the end of config file:

```
micro /etc/nixos/configuration.nix
```

```
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

and then:

```
sudo nixos-rebuild switch
```

---

# LOCATION OF CONFIG FILES

Once you have flakes enabled you can put your config files wherever you want with flakes.

Put all in nix in home folder.

```
mkdir ~/nix; cd ~/nix;
```

Copy all from /etc/nixos to nixcg folder.

```
cp /etc/nixos/configuration.nix ~/nix;
cp /etc/nixos/hardware-configuration ~/nix;
```

Create file flake.nix.

```
micro flake.nix
```
Add the following text for unstable packages:

```
{

  description = "One flake to rule them all";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    };

  outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
    in {
    nixosConfigurations = {
      niki = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
        };
      };
    };

}
```

**When you have flakes you rebuild with:**

```
sudo nixos-rebuild switch --flake .
```

**every time you update your system you update your flake file with:
(while inside your dotfiles directory)**

```
nix flake update
```
To actually update the system:

```
sudo nixos-rebuild switch --flake .
```

```
sudo nixos-rebuild switch --flake .#niki
```

---

# GITHUB OF NIXOS CHANNELS

https://github.com/NixOS/nixpkgs

(ODES GORE NA MASTER I VIDIS KOJI BRANCHEVI POSTOJE)
