# Thin Docker Dev Shell

A thin, language-agnostic Docker shell for day-to-day project work on:

- Windows with WSL2 and Antigravity
- macOS with Antigravity

简述：这是一个尽量薄、尽量通用的开发壳。

- 不预装 `node`、`python`、`go`、`rust` 等语言运行时
- 不提供项目模板、bootstrap 钩子或语言假设
- 只提供一层稳定、轻量、可复用的 Docker shell

The image includes only common command-line tools. Each project keeps control of its own runtime, package manager, and dependency setup.

## Overview

Use `devbox` as the shared shell, and let each project decide how to install its own toolchain.

```mermaid
flowchart LR
    A["Host: Windows WSL2 or macOS"] --> B["Project directory"]
    B --> C["devbox wrapper"]
    C --> D["devbox-shell image"]
    D --> E["Container shell (/workspace)"]
    E --> F["Project-managed runtimes and dependencies"]
```

## Why This Exists

- Reuse one stable shell across different projects and languages
- Keep the base image light and easy to maintain
- Avoid devcontainer sprawl, project templates, and runtime-specific assumptions
- Work the same way on WSL2 and macOS
- Let each repository own its own setup instead of hiding it in a shared image

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

## Design Rules

- Thin base image first
- No language runtime baked in
- No project-specific automation in the shared shell
- Cross-platform shell workflow over editor-specific integration
- Make the common layer boring, stable, and easy to replace

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

Typical project flow:

```bash
cd ~/projects/my-project
devbox
# inside the shell, use the setup defined by the project itself
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
- No hidden magic beyond "mount this directory and give me a clean shell"

If a project needs Node, Rust, Go, Python, Java, or other tooling, that project should install and manage it itself.

## Host Setup

- Windows and WSL2: `docs/windows-wsl-antigravity.md`
- macOS: `docs/macos-antigravity.md`
