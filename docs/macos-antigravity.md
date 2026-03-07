# macOS and Antigravity

Use this workflow on macOS:

1. Install Docker Desktop for Mac.
2. Keep active projects under your home directory, for example `~/projects`.
3. Open the project directly from that local path in Antigravity.
4. Run all `devbox` and Docker commands from the macOS terminal.

Recommended project location:

```bash
mkdir -p ~/projects
cd ~/projects
```

Install the launcher from the checked-out repository:

```bash
cd /path/to/setup
bash ./install-devbox.sh
```

Use it inside a project:

```bash
cd ~/projects/my-project
devbox
devbox bash -lc "git --version && pwd"
```

Notes:

- Prefer normal local directories under your home folder for bind mounts.
- For very large repositories or heavy watch workflows, Docker Desktop Synchronized file shares can help if your Docker plan includes that feature.
- Project-specific runtimes and dependencies stay in the project's own setup, not in this shell.
