#  casks
tap 'caskroom/homebrew-cask' || true
cask_args appdir: '/Applications'

cask 'google-chrome'
cask 'chromium'
cask 'vlc'
cask 'xquartz'
cask 'kitty'
cask 'vscodium'

# vcs
brew 'git'
brew 'git-lfs'

# editor
brew 'vim', args: ['--with-override-system-vi', '--with-client-server']

# wm
brew tap koekeishiya/formulae
brew install yabai
brew install koekeishiya/formulae/skhd

# install scripting-addition (will work only if you have SIP disable)
sudo yabai --install-sa

brew services start koekeishiya/formulae/yabai
brew services start skhd

# shell
brew 'zsh'
brew 'zsh-completions'
brew 'z'

# python
ibrew 'python'
brew 'flake8'
brew 'black'

# search
brew 'the_silver_searcher'

# build
brew 'automake'
brew 'autoconf'
brew 'cmake'

# conf
brew 'libyaml'
brew 'yaml-cpp'

# utils
brew 'htop'
brew 'wget'
brew 'markdown'

# applications
brew 'zim'

# gamedev
cask 'godot'

