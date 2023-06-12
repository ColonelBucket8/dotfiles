import os
import subprocess
from sys import platform
import re
import shutil

os_type = {"window": "win32", "mac": "darwin", "linux": "linux"}


def install_tmux():
    file = open("tmux/tmux.conf", "r")
    lines = file.read()
    file.close()

    is_dir_exist = os.path.isdir(os.path.join(
        os.path.expanduser("~"), ".config", "tmux"))

    dir_path = os.path.join(os.path.expanduser("~"), ".config", "tmux")
    file_path = os.path.join(dir_path, "tmux.conf")

    if (is_dir_exist):
        file_create = open(file_path, "w")
        file_create.write(lines)
    else:
        os.makedirs(dir_path)
        file_create = open(file_path, "w")
        file_create.write(lines)
        file_create.close()

    subprocess.run(
        f"git clone https://github.com/tmux-plugins/tpm {os.path.expanduser('~')}/.tmux/plugins/tpm")
    print("Successfully add tmux config")


def install_nvim():
    if platform == os_type["linux"] or platform == os_type["mac"]:
        subprocess.run(
            f"git clone https://github.com/ColonelBucket8/kickstart.nvim.git {os.path.expanduser('~')}/.config/nvim")
    elif platform == os_type["window"]:
        subprocess.run(
            f"git clone https://github.com/ColonelBucket8/kickstart.nvim.git {os.path.expanduser('~')}/AppData/Local/nvim")
    print("Successfully add neovim config")


def install_zsh():
    zsh_path = shutil.which("zsh")

    if zsh_path is None:
        print("zsh has not been installed yet")
    else:
        subprocess.run(
            'sh - c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')

        # Make zsh like fish
        subprocess.run(
            "git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions")
        subprocess.run(
            "git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search")
        subprocess.run(
            "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting")
        print("Add plugins to ~/.zshrc")
        print(
            "plugins=( [plugins...] zsh-autosuggestions history-substring-search zsh-syntax-highlighting)")

        # Install powerlevel10k
        subprocess.run(
            "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k")
        zsh_file_path = os.path.join(os.path.expanduser("~"), ".zshrc")
        zsh_file = open(zsh_file_path, "w")
        lines = zsh_file.read()
        result = re.sub(r"ZSH_THEME=(.*)",
                        'ZSH_THEME="powerlevel10k/powerlevel10k"', lines)
        zsh_file.write(result)
        zsh_file.close()
        print("Successfully add zsh config")


if platform == os_type["linux"] or platform == os_type["mac"]:
    install_tmux()
    install_zsh()
# elif os.system.platform == "darwin":
    # OS X
# elif os.system.platform == "win32":
    # Windows...

install_nvim()
