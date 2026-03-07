# Thin Docker Dev Shell

Thin, language-agnostic Docker shell for day-to-day project work on:

- Windows with WSL2 and Antigravity
- macOS with Antigravity

It is intentionally small. The image includes only common command-line tools and does not bake in `node`, `python`, `go`, `rust`, or any other language runtime. Each project keeps control of its own toolchain and dependency setup.

## Why This Exists

- Reuse one stable shell across different projects and languages
- Keep the base image light and easy to maintain
- Avoid devcontainer sprawl, project templates, and runtime-specific assumptions
- Work the same way on WSL2 and macOS

## What Is Included

- `Dockerfile`: base image for `devbox-shell`
- `devbox`: wrapper that builds and runs the shell
- `install-devbox.sh`: installs a small launcher into `~/.local/bin`
- `docs/windows-wsl-antigravity.md`: Windows and WSL2 host guidance
- `docs/macos-antigravity.md`: macOS host guidance

Installed tools:

- `bash`
- `curl`
- `git`
- `make`
- `openssh-client`
- `procps`
- `tini`
- `unzip`
- `xz-utils`

## Quick Start

Install the launcher:

```bash
bash ./install-devbox.sh
```

Start a shell in any project directory:

```bash
cd /path/to/project
devbox
```

Run a one-shot command:

```bash
devbox bash -lc "git --version && pwd"
```

Force a rebuild of the image:

```bash
devbox --rebuild
```

## How It Works

- The current directory is mounted to `/workspace`
- `/home/dev` is stored in the named Docker volume `devbox-home`
- The image is built automatically on first run
- The default container user is `dev`
- No ports, SSH agents, or language-specific environment variables are injected automatically

## Public Interface

- `devbox`
- `devbox --rebuild`
- `devbox <command...>`
- `DEVBOX_IMAGE`
- `DEVBOX_HOME_VOLUME`

## Non-Goals

- No project templates
- No language-specific bootstrap hooks
- No automatic runtime installation
- No per-project system package management

If a project needs Node, Rust, Go, Python, Java, or other tooling, that project should install and manage it itself.

## Host Setup

- Windows and WSL2: `docs/windows-wsl-antigravity.md`
- macOS: `docs/macos-antigravity.md`
