import os
import subprocess
from sys import platform
import re
import shutil
import requests
import zipfile
import io

os_type = {"window": "win32", "mac": "darwin", "linux": "linux"}
home_dir = os.path.expanduser("~")


def add_tmux_config():
    tmux_path = shutil.which("tmux")

    if tmux_path is None:
        print("Tmux has not been installed yet")
        return

    file = open("tmux/tmux.conf", "r")
    lines = file.read()
    file.close()

    is_dir_exist = os.path.isdir(os.path.join(home_dir, ".config", "tmux"))

    dir_path = os.path.join(home_dir, ".config", "tmux")
    file_path = os.path.join(dir_path, "tmux.conf")

    if is_dir_exist:
        file_create = open(file_path, "w")
        file_create.write(lines)
    else:
        os.makedirs(dir_path)
        file_create = open(file_path, "w")
        file_create.write(lines)
        file_create.close()

    subprocess.run(
        [
            "git",
            "clone",
            "https://github.com/tmux-plugins/tpm",
            f"{home_dir}/.tmux/plugins/tpm",
        ]
    )
    print("Successfully add tmux config")


def add_nvim_config():
    if platform == os_type["linux"] or platform == os_type["mac"]:
        subprocess.run(
            [
                "git",
                "clone",
                "https://github.com/ColonelBucket8/kickstart.nvim.git",
                f"{home_dir}/.config/nvim",
            ]
        )
    elif platform == os_type["window"]:
        subprocess.run(
            [
                "git",
                "clone",
                "https://github.com/ColonelBucket8/kickstart.nvim.git",
                f"{home_dir}/AppData/Local/nvim",
            ]
        )
    print("Successfully add neovim config")


def add_zsh_config():
    zsh_path = shutil.which("zsh")

    if zsh_path is None:
        print("zsh has not been installed yet")
    else:
        r = requests.get(
            "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
        )
        if not r.ok:
            print("Cannot get oh my zsh")
            return

        subprocess.run(["sh", "-c", r.content])

        zsh_custom = os.getenv("ZSH_CUSTOM") or f"{home_dir}/.oh-my-zsh/custom"

        # Make zsh like fish
        subprocess.run(
            [
                "git",
                "clone",
                "https://github.com/zsh-users/zsh-autosuggestions.git",
                f"{zsh_custom}/plugins/zsh-autosuggestions",
            ]
        )

        subprocess.run(
            [
                "git",
                "clone",
                "https://github.com/zsh-users/zsh-history-substring-search",
                f"{zsh_custom}/plugins/zsh-history-substring-search",
            ]
        )

        subprocess.run(
            [
                "git",
                "clone",
                "https://github.com/zsh-users/zsh-syntax-highlighting.git",
                f"{zsh_custom}/plugins/zsh-syntax-highlighting",
            ]
        )

        # Install powerlevel10k

        subprocess.run(
            [
                "git",
                "clone",
                "--depth=1",
                "https://github.com/romkatv/powerlevel10k.git",
                f"{zsh_custom}/themes/powerlevel10k",
            ]
        )

        zsh_file_path = os.path.join(home_dir, ".zshrc")
        zsh_file = open(zsh_file_path, "r")
        lines = zsh_file.read()
        result = re.sub(
            r"ZSH_THEME=(.*)", 'ZSH_THEME="powerlevel10k/powerlevel10k"', lines
        )
        result2 = re.sub(
            r"plugins=(.*)",
            "plugins=(git zsh-autosuggestions history-substring-search zsh-syntax-highlighting)",
            result,
        )
        zsh_file.close()

        zsh_file_write = open(zsh_file_path, "w")
        zsh_file_write.write(result2)
        zsh_file_write.close()

        print("Successfully add zsh config")


def install_font():
    r = requests.get(
        "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip"
    )

    if r.ok:
        z = zipfile.ZipFile(io.BytesIO(r.content))
        os.makedirs("./font")
        z.extractall("./font")
        path_to_save = ""
        if platform == os_type["window"]:
            path_to_save = os.path.join(
                home_dir,
                "AppData",
                "Local",
                "Microsoft",
                "Windows",
                "Fonts",
            )
        else:
            path_to_save = os.path.join(home_dir, ".fonts")

        if not os.path.isdir(path_to_save):
            os.makedirs(path_to_save)

        src_files = os.listdir("./font")
        for file_name in src_files:
            full_file_name = os.path.join("./font", file_name)
            if os.path.isfile(full_file_name):
                shutil.copy(full_file_name, path_to_save)

        shutil.rmtree("./font", ignore_errors=True)

    else:
        print("Fail to download font")


def install_nvm():
    nvm_path = shutil.which("nvm")

    if nvm_path:
        print("Nvm is already installed")
    else:
        r = requests.get(
            "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh"
        )

        if not r.ok:
            print("Cannot get nvm")
            return

        subprocess.run(["sh", "-c", r.content])

        print("Successfully install nvm")


def add_kitty_config():
    kitty_dir = f"{home_dir}/.config/kitty"

    if not os.path.isdir(kitty_dir):
        os.makedirs(kitty_dir)

    kitty_file = open("./kitty/kitty.conf", "r")
    kitty_config = kitty_file.read()
    kitty_file.close()

    kitty_path = open(f"{ kitty_dir }/kitty.conf", "w")
    kitty_path.write(kitty_config)
    kitty_path.close()

    print("Successfully add kitty config")


add_nvim_config()
install_font()

if platform == os_type["linux"] or platform == os_type["mac"]:
    add_tmux_config()
    install_nvm()
    add_zsh_config()
    add_kitty_config()
# elif os.system.platform == "darwin":
# OS X
# elif os.system.platform == "win32":
# Windows...
