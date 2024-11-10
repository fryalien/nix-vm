# HOMEMANAGER SETUP

**INSTALLING STANDALONE**
- manged by user accounts
- system and user configurations are separated

https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone

```
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
```
```
nix-channel --update
```

```
nix-shell '<home-manager>' -A install
```

**if you get error like home manager source not found, or whatever, just logout and run install again**

If it's installed properly it will say staring home manaer activation...

It will crate a file `home.nix`


**REBUILD SYSTEM WHIT HOME MANAGER (rebuild switch in nixos)**

```
home-manager switch
```

copy `home.nix` to you dofiles directory

```
cp ~./config/home-manager/home.nix ~/.dotfiles
```

**ADD HOMEMANAGER TO YOUR FLAKE FILE**

>> look at flake config file

~/nixcfg

**AFTER EDITING RUN in config dir:**
(all config files shoud have user permission)

```
home-manager switch --flake .
```
