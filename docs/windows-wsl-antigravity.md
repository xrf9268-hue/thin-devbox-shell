# Windows, WSL2, and Antigravity

Use this workflow on Windows:

1. Install and enable WSL2.
2. Install Docker Desktop and use Linux containers with the WSL 2 backend.
3. Enable WSL integration for your Linux distribution in Docker Desktop.
4. Keep active projects in the WSL filesystem, for example `~/projects`.
5. Open the project from its WSL path in the host Codex app or Antigravity.
6. Run all `devbox` and Docker commands from a WSL shell that is already inside the current repository or worktree.

Recommended project location:

```bash
mkdir -p ~/projects
cd ~/projects
```

Install the launcher from the checked-out repository:

```bash
cd /path/to/thin-devbox-shell
bash ./install-devbox.sh
```

If the repository lives on the Windows filesystem, the WSL path will usually look like:

```bash
cd /mnt/c/path/to/thin-devbox-shell
```

Use it inside a project:

```bash
cd ~/projects/my-project
devbox
devbox bash -lc "git --version && pwd"
```

Codex app workflow:

- Open the repository from its WSL path in the host Codex app.
- If Codex creates a worktree or isolated copy for a task, open a terminal in that exact directory before running `devbox`.
- If you want separate shell state per repository or worktree, override the default volume:

```bash
DEVBOX_HOME_VOLUME=devbox-home-my-project devbox
```

Notes:

- Keep the project in the Linux filesystem, not in `C:\...`, for better file-system behavior with Docker Desktop.
- The host editor or Codex app should open the WSL-backed project path and use a WSL terminal for commands.
- Project-specific runtimes and dependencies stay in the project's own setup, not in this shell.
