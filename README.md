# Thin Docker Dev Shell

This repository provides a thin, language-agnostic Docker development shell for:

- Windows with WSL2 and Antigravity
- macOS with Antigravity

The shell is intentionally minimal. It includes only common command-line tools and does not preinstall `node`, `python`, `go`, `rust`, or other language runtimes. Each project remains responsible for its own runtime and dependency setup.

## What You Get

- `Dockerfile`: the base `devbox-shell` image
- `devbox`: the wrapper that builds and runs the shell
- `install-devbox.sh`: installs a small launcher into `~/.local/bin`
- `docs/windows-wsl-antigravity.md`: Windows and WSL2 host guidance
- `docs/macos-antigravity.md`: macOS host guidance

## Quick Start

Install the launcher from this repository:

```bash
bash ./install-devbox.sh
```

Open any project directory and start the shell:

```bash
cd /path/to/project
devbox
```

Run a one-shot command:

```bash
devbox bash -lc "git --version && pwd"
```

## Behavior

- The current directory is mounted to `/workspace`
- `/home/dev` is stored in the named Docker volume `devbox-home`
- The image is built automatically on first run
- `devbox --rebuild` forces a rebuild of the image
- No ports, SSH agents, or language-specific environment variables are injected automatically

## Public Interface

- Command: `devbox`
- Command: `devbox --rebuild`
- Command: `devbox <command...>`
- Environment variable: `DEVBOX_IMAGE`
- Environment variable: `DEVBOX_HOME_VOLUME`

## Support Boundary

- This repository does not provide project templates
- This repository does not provide language-specific bootstrap hooks
- This repository does not manage system packages for individual projects
- If a project needs Node, Rust, Go, Python, or other toolchains, that project must install them itself

## Host Setup

- Windows and WSL2: see `docs/windows-wsl-antigravity.md`
- macOS: see `docs/macos-antigravity.md`
