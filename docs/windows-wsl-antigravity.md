# Windows, WSL2, and Antigravity

Use this workflow on Windows:

1. Install and enable WSL2.
2. Install Docker Desktop and use Linux containers with the WSL 2 backend.
3. Enable WSL integration for your Linux distribution in Docker Desktop.
4. Keep active projects in the WSL filesystem, for example `~/projects`.
5. Open the project from its WSL path in Antigravity.
6. Run all `devbox` and Docker commands from a WSL shell.

Recommended project location:

```bash
mkdir -p ~/projects
cd ~/projects
```

Install the launcher from the checked-out repository:

```bash
cd /mnt/c/developer/setup
bash ./install-devbox.sh
```

Use it inside a project:

```bash
cd ~/projects/my-project
devbox
devbox bash -lc "git --version && pwd"
```

Notes:

- Keep the project in the Linux filesystem, not in `C:\...`, for better file-system behavior with Docker Desktop.
- Antigravity should open the WSL-backed project path and use a WSL terminal for commands.
- Project-specific runtimes and dependencies stay in the project's own setup, not in this shell.
