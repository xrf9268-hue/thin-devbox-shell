# Consumer Repository Contract

This repository provides a thin, reusable Docker shell for a repository or
worktree. It is an optional execution layer, not a project template and not a
project workflow definition.

Consumer repositories should use this document as the boundary between the
shared shell and repository-specific development policy.

## What This Repository Provides

- A small Docker image with common CLI tools
- A `devbox` launcher that mounts the current repository or worktree at
  `/workspace`
- A persistent home volume for shell history and user-level cache state
- A host-first workflow that works on Windows with WSL2 and on macOS

## What This Repository Does Not Provide

- Language runtimes such as Node, Python, Go, Rust, or Java
- Project dependency installation or bootstrap hooks
- Project branch strategy, worktree policy, or release workflow
- Project tests, end-to-end validation, or online-install procedures
- CI policies beyond validating this shared shell image
- A guarantee that Docker CLI or Docker socket access exists inside `devbox`

## Contract for Consumer Repositories

If a repository uses `thin-devbox-shell`, that repository should still define
and own the following:

- Host-shell setup instructions
- Repository-specific prerequisites and dependencies
- Build, lint, unit test, integration test, and release commands
- Docker lifecycle and online-install procedures, if applicable
- AGENTS, CONTRIBUTING, and session-start guidance for coding agents
- Branch and worktree conventions for parallel work

The repository workflow must remain understandable and executable even when
`devbox` is not used.

## Recommended Integration Pattern

1. Open the repository or worktree in the host Codex app.
2. Choose the execution mode for the task:
   - host shell as the baseline
   - `devbox` when a thin reproducible shell is useful
3. Run the repository-defined setup, validation, and release commands from that
   working copy.
4. Use host Docker for lifecycle or online-install tests unless the repository
   explicitly documents another supported model.

## Guidance for Repository Authors

When documenting a repository that optionally uses this shell:

- Do not write docs that require `devbox` as the only supported entrypoint.
- Do not assume Docker-in-Docker support.
- Do not hardcode machine-specific paths.
- Keep repository workflow docs in the repository itself.
- Prefer scripts or `make` targets for repeated validation flows.

## Example Boundary

Use this shared shell repo for:

- consistent shell access
- common CLI tooling
- cross-machine portability of the shell layer

Keep these in the consumer repository:

- runtime installation
- dependency management
- project-specific test matrices
- installation, reinstall, uninstall, and migration flows
- CI follow-up rules after push or PR updates
