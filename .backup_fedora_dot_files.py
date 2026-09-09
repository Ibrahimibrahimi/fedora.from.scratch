import subprocess
import os

def output(command:str):
    return subprocess.run(command.split(" "),capture_output=True).stdout

def extract_name_from_path(fullpath:str):
    if "/" in fullpath :
        return fullpath.split("/")[-1]

BACKUP_FOLDER_REPO = "backup"

important_files = [
    "/home/eldorado/opencode.py",# cli agent
    "/home/eldorado/disable_compositor.sh", # in case of fresh install, run this
    # shell 
    "/home/eldorado/.p10k.zsh",
    "/home/eldorado/.shell.pre-oh-my-zsh",
    "/home/eldorado/.zsh_history",
    "/home/eldorado/.zshenv",
    "/home/eldorado/.zshrc",
]
important_folders = [
    "/home/eldorado/tools", # contains all tools that zsh aliases uses
    # shell
    "/home/eldorado/.oh-my-zsh",
    "/home/eldorado/powerlevel10k", # zsh theme
    # themes & icons
    "/home/eldorado/.themes",
    "/home/eldorado/.icons",
    "/home/eldorado/Pictures/wallpapers", # wallpapers
    
    # nvim 
    "~/.local/share/nvim/", # plugins
    "/home/eldorado/.config/nvim/",
    
    # some useful to save
    "/home/eldorado/Desktop/assets",
    "/home/eldorado/Desktop/Docs & Supports",
    "/home/eldorado/Desktop/self hosted/LMPS/mine",
    "/home/eldorado/Desktop/self.dev",
]



important_tosave_text = "; ".join(
    [
        str(output("tree ~/Desktop")),
        str(output("ls ~/"))
    ]
)

# NOTE !!!!!!!!!!!!!!!
# the folder ~/Desktop/.fedora.bkp should exists
# this script runs from the repo backup : .fedora.bkp

# loop over all files / folders and copy them to the backup folder repo

log = "[FILES]\n"

for file in important_files :
    file = os.path.expanduser(file)
    
    # copy the file
    os.system(f"cp -v {file} {BACKUP_FOLDER_REPO}")

    # commit & push after each file (to prevent large files upload)
    os.system(f"git add -A && git commit -m 'added file {file}' && git push")
    
    # add to log
    log += f"copied {file} to .;" + "\n\t"

log += "[FOLDERS]\n"

for folder in important_folders :
    folder = os.path.expanduser(folder)
    
    # copy the folder recursively
    os.system(f"cp -vr {folder} {BACKUP_FOLDER_REPO}/")

    # commit & push
    os.system(f"git add -A && git commit -m 'added file {file}' && git push")
    
    # add to log
    log += f"copied {folder} to .;" + "\n\t"

# save log
with open("log.txt","w") as f :
    f.write(log)
