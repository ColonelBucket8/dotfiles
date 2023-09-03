#!/bin/bash

os_type=("window" "mac" "linux")
home_dir="$HOME"

function add_tmux_config() {
  tmux_path=$(which tmux)

  if [ -z "$tmux_path" ]; then
    echo "Tmux has not been installed yet"
    return
  fi

  lines=$(cat tmux/tmux.conf)

  is_dir_exist=false

  if [ -d "$home_dir/.config/tmux" ]; then
    is_dir_exist=true
  else
    mkdir -p "$home_dir/.config/tmux"
  fi

  file_path="$home_dir/.config/tmux/tmux.conf"
  echo "$lines" >"$file_path"

  git clone "https://github.com/tmux-plugins/tpm" "$home_dir/.tmux/plugins/tpm"
  echo "Successfully add tmux config"
}

function add_nvim_config() {
  if [ "$(uname)" == "${os_type[2]}" ] || [ "$(uname)" == "${os_type[1]}" ]; then
    git clone "https://github.com/ColonelBucket8/kickstart.nvim.git" "$home_dir/.config/nvim"
  elif [ "$(uname)" == "${os_type[0]}" ]; then
    git clone "https://github.com/ColonelBucket8/kickstart.nvim.git" "$home_dir/AppData/Local/nvim"
  fi

  echo "Successfully add neovim config"
}

function add_zsh_config() {
  zsh_path=$(which zsh)

  if [ -z "$zsh_path" ]; then
    echo "zsh has not been installed yet"
  else
    r=$(curl -s "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh")

    if [ ! -z "$r" ]; then
      sh -c "$r"
    else
      echo "Cannot get oh my zsh"
      return
    fi

    zsh_custom="${ZSH_CUSTOM:-$home_dir/.oh-my-zsh/custom}"

    # Make zsh like fish
    git clone "https://github.com/zsh-users/zsh-autosuggestions.git" "$zsh_custom/plugins/zsh-autosuggestions"
    git clone "https://github.com/zsh-users/zsh-history-substring-search" "$zsh_custom/plugins/zsh-history-substring-search"
    git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$zsh_custom/plugins/zsh-syntax-highlighting"

    # Install powerlevel10k
    git clone --depth=1 "https://github.com/romkatv/powerlevel10k.git" "$zsh_custom/themes/powerlevel10k"

    zsh_file_path="$home_dir/.zshrc"
    lines=$(cat "$zsh_file_path")
    result1=$(echo "$lines" | sed -E 's/ZSH_THEME=(.*)/ZSH_THEME="powerlevel10k\/powerlevel10k"/')
    result2=$(echo "$result1" | sed -E 's/plugins=(.*)/plugins=(git zsh-autosuggestions history-substring-search zsh-syntax-highlighting)/')
    echo "$result2" >"$zsh_file_path"
    echo "Successfully add zsh config"
  fi
}

function install_font() {
  r=$(curl -L -o font.zip "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip")

  if [ -f "font.zip" ]; then
    unzip -q font.zip -d "./font"
    rm "font.zip"

    if [ "$(uname)" == "${os_type[0]}" ]; then
      path_to_save="$home_dir/.fonts"
    elif [ "$(uname)" == "${os_type[2]}" ]; then
      path_to_save="$home_dir/.fonts"
    elif [ "$(uname)" == "${os_type[1]}" ]; then
      path_to_save="$home_dir/Library/Fonts"
    fi

    if [ ! -d "$path_to_save" ]; then
      mkdir -p "$path_to_save"
    fi

    src_files=$(ls "./font")
    for file_name in $src_files; do
      full_file_name="./font/$file_name"
      if [ -f "$full_file_name" ]; then
        cp "$full_file_name" "$path_to_save"
      fi
    done

    rm -rf "./font"
  else
    echo "Fail to download font"
  fi
}

function install_nvm() {
  nvm_path=$(which nvm)

  if [ -n "$nvm_path" ]; then
    echo "Nvm is already installed"
  else
    r=$(curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh")

    if [ ! -z "$r" ]; then
      sh -c "$r"
      echo "Successfully install nvm"
    else
      echo "Cannot get nvm"
    fi
  fi
}

function add_kitty_config() {
  kitty_dir="$home_dir/.config/kitty"

  if [ ! -d "$kitty_dir" ]; then
    mkdir -p "$kitty_dir"
  fi

  cat "./kitty/kitty.conf" >"$kitty_dir/kitty.conf"
  echo "Successfully add kitty config"
}

add_nvim_config
install_font

if [ "$(uname)" == "${os_type[2]}" ] || [ "$(uname)" == "${os_type[1]}" ]; then
  add_tmux_config
  install_nvm
  add_zsh_config
  add_kitty_config
fi

