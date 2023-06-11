import os
import subprocess
from sys import platform

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

if platform == "linux" or platform == "darwin":
    install_tmux()
# elif os.system.platform == "darwin":
    # OS X
# elif os.system.platform == "win32":
    # Windows...



