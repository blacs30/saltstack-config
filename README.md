# saltstack-dotfiles
My personal dotfiles, coordinated by SaltStack

## Prerequisites
You must have `wget` installed. Everybody has that installed though, right?

## Install brew and saltstack, optionally run highstate
```
./init.sh
```

## Run saltstack manually
For a local run (without sudo permissions, which cannot install cask or profiles) execute
```
salt-call -c ~/saltstack-config state.sls dotfiles
```

This runs the state dotfiles and would install all dotfiles.

You can also run this with sudo privileges which allows to install brew casks and profiles
```
su ladmin -c 'sudo salt-call -c /Users/normaluser/saltstack-config state.show_sls profiles.dock'
```

Since  my normaluser doesn't have sudo permissions I have to su to my `ladmin` user and run salt-call with sudo.
