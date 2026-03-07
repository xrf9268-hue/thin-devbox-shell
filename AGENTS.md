# AGENTS.md

## Project purpose

This repository provides a thin, language-agnostic Docker dev shell.

Use it to get a reproducible shell for the current repository or worktree.
Do not treat it as a project template or a language runtime image.

## Primary workflow

- Use the host Codex app as the main control surface.
- Open the repository or worktree on the host.
- Run `devbox` only from the exact repository or worktree directory you want to operate on.
- On Windows, prefer active projects in the WSL Linux filesystem.

## Repository layout

- `Dockerfile`: base image for `devbox-shell`
- `devbox`: wrapper that builds and runs the shell
- `install-devbox.sh`: installs a launcher into `~/.local/bin`
- `docs/`: host setup and usage notes for Windows WSL2 and macOS
- `README.md`: human-facing overview

## Guardrails

- Keep the image thin.
- Do not bake in Node, Python, Go, Rust, Java, or other language runtimes unless explicitly requested.
- Do not add project templates, bootstrap hooks, or project-specific package installation logic unless explicitly requested.
- Do not hardcode machine-specific paths in docs.
- Keep the host-first model: Codex app on the host, `devbox` as the reusable shell layer.
- Preserve cross-platform Bash behavior for WSL2 and macOS.
- Pin third-party GitHub Actions to full commit SHAs.

## Validation commands

Run these from the repository root when you change shell or image behavior:

- `bash -n devbox`
- `bash -n install-devbox.sh`
- `docker build --check .`
- `docker build --pull -t devbox-shell .`

If you are validating the installed launcher in WSL or macOS:

- `~/.local/bin/devbox whoami`
- `~/.local/bin/devbox pwd`
- `~/.local/bin/devbox git --version`
- `~/.local/bin/devbox rg --version`

## Documentation rules

- Update `README.md` when public workflow or positioning changes.
- Update `docs/windows-wsl.md` and `docs/macos.md` when host setup or usage changes.
- Keep `README.md` concise for humans; put agent-specific operating guidance here.

## Non-goals

- This repository does not manage per-project runtimes.
- This repository does not manage per-project dependencies.
- This repository does not handle secrets, SSH agent forwarding, or project-specific dev environment policy by default.
