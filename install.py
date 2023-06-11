import os
import subprocess
from sys import platform

os_type = { "window": "win32", "mac": "darwin", "linux": "linux"}

def install_tmux():
    file = open("tmux/tmux.conf","r")
    lines = file.read()
    file.close()
    
    is_dir_exist = os.path.isdir(os.path.join(os.path.expanduser("~"), ".config", "tmux"))

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

    subprocess.run(f"git clone https://github.com/tmux-plugins/tpm {os.path.expanduser('~')}/.tmux/plugins/tpm")

def install_nvim():
    if platform == os_type["linux"] or platform == os_type["mac"]:
        subprocess.run(f"git clone https://github.com/ColonelBucket8/kickstart.nvim.git {os.path.expanduser('~')}/.config/nvim")
    elif platform == os_type["window"]:
        subprocess.run(f"git clone https://github.com/ColonelBucket8/kickstart.nvim.git {os.path.expanduser('~')}/AppData/Local/nvim")

if platform == os_type["linux"] or platform == os_type["mac"]:
    install_tmux()
# elif os.system.platform == "darwin":
    # OS X
# elif os.system.platform == "win32":
    # Windows...

install_nvim()



