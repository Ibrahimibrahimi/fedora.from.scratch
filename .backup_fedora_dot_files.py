import subprocess
import os
import shlex

BACKUP_DIR = "backup"  # subfolder inside current repo

def run(cmd: list[str]) -> str:
    return subprocess.run(cmd, capture_output=True, text=True).stdout.strip()

def output(command: str) -> bytes:
    return subprocess.run(shlex.split(command), capture_output=True).stdout

def extract_name_from_path(fullpath: str) -> str:
    return fullpath.split("/")[-1]

def ensure_backup_dir():
    """Create the backup/ folder if it doesn't exist."""
    os.makedirs(BACKUP_DIR, exist_ok=True)
    print(f"[+] Backup folder ready: {BACKUP_DIR}/")

def remove_git_artifacts_from_backup():
    """
    Search for all .git/ dirs and .gitignore files INSIDE the backup/ folder
    and remove them. The .git/ at '.' (the repo root) is never touched.
    """
    print("\n[~] Scanning for .git/ and .gitignore inside backup/ ...")

    # Find .gitignore files inside backup/
    gitignore_files = run(["find", BACKUP_DIR, "-name", ".gitignore"]).splitlines()
    for path in gitignore_files:
        if path:
            print(f"  Removing .gitignore: {path}")
            os.remove(path)

    # Find .git/ directories inside backup/
    git_dirs = run(["find", BACKUP_DIR, "-name", ".git", "-type", "d"]).splitlines()
    for path in git_dirs:
        if path:
            print(f"  Removing .git/: {path}")
            subprocess.run(["rm", "-rf", path])

    print("[+] Git artifacts cleaned from backup/")

def safe_commit(label: str):
    """Commit only if there are staged changes."""
    result = subprocess.run(
        ["git", "diff", "--cached", "--quiet"],
        capture_output=True
    )
    if result.returncode != 0:  # non-zero = there are staged changes
        subprocess.run(["git", "commit", "-m", f"backup: added {label}"])

def copy_and_commit(src: str, label: str):
    """Copy a file or folder into backup/, then git add & commit."""
    src = os.path.expanduser(src)
    # dest = os.path.join(BACKUP_DIR, extract_name_from_path(src))
    dest = "."
    if os.path.isdir(src):
        subprocess.run(["cp", "-r", src, dest])
    elif os.path.isfile(src):
        subprocess.run(["cp", src, dest])
    else:
        print(f"  [!] Skipped (not found): {src}")
        return

    subprocess.run(["git", "add", "-A"])
    safe_commit(f"{label}: {src}")
    print(f"  [✓] {src}")


# ── Main ──────────────────────────────────────────────────────────────────────

important_files = [
    "/home/eldorado/opencode.py",
    "/home/eldorado/disable_compositor.sh",
    "/home/eldorado/.p10k.zsh",
    "/home/eldorado/.shell.pre-oh-my-zsh",
    "/home/eldorado/.zsh_history",
    "/home/eldorado/.zshenv",
    "/home/eldorado/.zshrc",
]

important_folders = [
    "/home/eldorado/tools",
    "/home/eldorado/.oh-my-zsh",
    "/home/eldorado/powerlevel10k",
    "/home/eldorado/.themes",
    "/home/eldorado/.icons",
    "/home/eldorado/Pictures/wallpapers",
    "~/.local/share/nvim/",
    "/home/eldorado/.config/nvim/",
    "/home/eldorado/Desktop/assets",
    "/home/eldorado/Desktop/Docs & Supports",
    "/home/eldorado/Desktop/self hosted/LMPS/mine",
    "/home/eldorado/Desktop/self.dev",
]

ensure_backup_dir()

print("\n[FILES]")
for f in important_files:
    copy_and_commit(f, "file")

print("\n[FOLDERS]")
for folder in important_folders:
    copy_and_commit(folder, "folder")

# Clean AFTER copying so we don't accidentally nuke the repo's own .git/
remove_git_artifacts_from_backup()

# Save a snapshot log
important_tosave_text = "\n".join([
    str(output("tree ~/Desktop")),
    str(output("ls ~/"))
])

log_path = os.path.join(BACKUP_DIR, "log.txt")
with open(log_path, "w") as f:
    f.write(important_tosave_text)

subprocess.run(["git", "add", "-A"])
safe_commit("log.txt snapshot")

print("\n[✓] Backup complete.")
