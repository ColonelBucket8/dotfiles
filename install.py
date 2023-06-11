import os

def install_tmux():
    file = open("tmux/tmux.conf","r")
    lines = file.read()
    file.close()
    
    is_dir_exist = os.path.isdir(os.path.join(os.path.expanduser("~"), ".config", "tmux"))

    file_path = os.path.join(os.path.expanduser("~"), ".config", "tmux", "tmux.conf")

    if (is_dir_exist):
        file_create = open(file_path, "w")
        file_create.write(lines)
    else:
        os.makedirs(os.path.join(os.path.expanduser("~"), ".config", "tmux"))
        file_create = open(file_path, "w")
        file_create.write(lines)
        file_create.close()

install_tmux()


