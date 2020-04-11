# osx_dotfiles
My dotfiles and setup for osx dev environment

Focused on Flutter/Python Development and some Game Development in Godot
Also adds my shortcuts, aliases and settings into new osx install

Tries to mimic an i3 experience using [Yabai](https://github.com/koekeishiya/yabai) and [skhd](https://github.com/koekeishiya/skhd)

## Install

To install run 
```
curl LO https://raw.githubusercontent.com/VitoMinheere/osx_dotfiles/master/setup.sh
./setup.sh
```

## Structure

```
Alias files

.config/aliasrc         Basic alias for things in the system
.config/dev_aliasrc     Custom alias for personal projects(not in repo)

```

## Manual steps

Currently some manual steps are needed to have Flutter actually see the Android sdk location. These include starting up Android Studio and completing the install, including downloading the extensions for Flutter and Dart. 

Xcode also needs to be manually downloaded as i am currently running Mojave for which you need to get XCode 10.3 from the Apple Developer website. 
