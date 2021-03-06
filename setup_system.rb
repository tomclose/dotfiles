#!/usr/bin/env ruby

# Utility functions
# =================

def display(str, color: nil)
  color_codes = { red: 31, green: 32, yellow: 33, blue: 34, pink: 35 }
  color_code = color_codes[color]
  if color_code
    puts "\e[#{color_code}m#{str}\e[0m"
  else
    puts "#{str}"
  end
end

def x(command, color: :pink)
  display(command, color: color)
  system(command)
end

def heading(str)
  puts ""
  display("#{str}", color: :yellow)
  display("=" * str.length, color: :yellow)
  puts ""
end

def brew_install(package)
  x("brew install #{package}")
end

# Start Setup
# ===========

heading("Creating symlinks")
x("ln -s ~/.dotfiles/global_gitignore ~/.gitignore_global")
x("ln -s ~/.dotfiles/gitconfig ~/.gitconfig")
x("ln -s ~/.dotfiles/zshrc ~/.zshrc")
x("ln -s ~/.dotfiles/vimrc.before ~/.vimrc.before")
x("ln -s ~/.dotfiles/vimrc.after ~/.vimrc.after")
x("ln -s ~/.dotfiles/gvimrc.after ~/.gvimrc.after")


# install homebrew (if not installed)
heading("Installing brew")
if system("which brew")
  # if you're setting up a second account on a laptop with brew already installed, you will need
  # to change the permissions of /usr/local to allow both accounts to use homebrew: https://gist.github.com/jaibeee/9a4ea6aa9d428bc77925
else # install homebrew
  x("mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew")
end

# install janus vim
heading("Installing janus vim")
unless File.exists?("#{Dir.home}/.vimrc")
  x("curl -L https://bit.ly/janus-bootstrap | bash")
end

# install zsh
heading("Installing zsh")
brew_install("zsh")
brew_install("zsh-completions")
unless Dir.exists?("#{Dir.home}/.oh-my-zsh")
  x('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')
  x('mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc')
end

# Install homebrew git
heading("Installing git")
brew_install("git")

# Iterm2
# Need to install iterm2 first. Can I do that from a script?

# Following instructions from from http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/
# Specify the preferences directory
x('defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2_profile"')
# Tell iTerm2 to use the custom preferences in the directory
x('defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true')


