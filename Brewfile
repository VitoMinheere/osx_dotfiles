#  casks
tap 'homebrew/homebrew-cask' || true
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
brew tap 'koekeishiya/formulae'
brew install 'yabai'
brew install 'koekeishiya/formulae/skhd'

tap 'homebrew/services'
brew services start 'koekeishiya/formulae/yabai'
brew services start 'skhd'

# shell
brew 'zsh'
brew 'zsh-completions'
brew 'z'

# python
brew 'python'
brew 'flake8'
brew 'black'

# search
brew 'the_silver_searcher'

# utils
brew 'htop'
brew 'wget'
brew 'markdown'

# applications
brew 'zim'

# gamedev
cask 'godot'

