# macOS

Use this workflow on macOS:

1. Install Docker Desktop for Mac.
2. Keep active projects under your home directory, for example `~/projects`.
3. Open the project directly from that local path in the host Codex app.
4. Run all `devbox` and Docker commands from the macOS terminal that is already inside the current repository or worktree.

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

Use it inside a project:

```bash
cd ~/projects/my-project
devbox
devbox bash -lc "git --version && pwd"
```

Project development loop:

1. Open the repository or worktree in the host Codex app.
2. Open a host terminal in that exact directory.
3. Run `devbox`.
4. Inside the container, use the commands defined by the project itself.
5. Exit with `exit` and rerun `devbox` from the same directory when needed.

Inside the container:

- `/workspace` is your mounted repository or worktree.
- `/home/dev` is persistent shell state stored in a Docker volume.
- Language runtimes and project dependencies remain the responsibility of the project.

Codex app workflow:

- Open the repository from its local path in the host Codex app.
- If Codex creates a worktree or isolated copy for a task, open a terminal in that exact directory before running `devbox`.
- If you want separate shell state per repository or worktree, override the default volume:

```bash
DEVBOX_HOME_VOLUME=devbox-home-my-project devbox
```

Notes:

- Prefer normal local directories under your home folder for bind mounts.
- For very large repositories or heavy watch workflows, Docker Desktop Synchronized file shares can help if your Docker plan includes that feature.
- Treat the Codex app as the primary control surface. If you also use an editor, point it at the same local project path and run commands from the host terminal.
- Project-specific runtimes and dependencies stay in the project's own setup, not in this shell.
