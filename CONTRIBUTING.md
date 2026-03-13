# Contributing to harnest

Thanks for your interest in contributing to harnest! This guide covers the fork workflow and how to add new chicks to the nest.

## The Language

harnest uses bird-centric terminology throughout the codebase:

- **nest** — the `nest/` directory; the collection of all chicks
- **chick** — a specific team configuration (e.g., `fullstack`) scaffolded by `harnest hatch`
- **hatch** — the init command; scaffolds a chick into a project
- **fly** — the start command; launches agents in tmux split panes
- **land** — the stop command; tears down the tmux session

When writing code, docs, or error messages, prefer this vocabulary over "template", "init", "start", and "stop".

## Fork Workflow

1. **Fork** the repository on GitHub: [gioperalto/harnest](https://github.com/gioperalto/harnest)
2. **Clone** your fork:
   ```bash
   git clone https://github.com/<your-username>/harnest.git
   cd harnest
   ```
3. **Create a branch** for your change:
   ```bash
   git checkout -b feature/my-change
   ```
4. **Make your changes**, commit, and push:
   ```bash
   git push -u origin feature/my-change
   ```
5. **Open a Pull Request** against `gioperalto/harnest:main`.

## Creating a New Chick

Chicks live in the `nest/` directory. Each chick is a self-contained directory with everything `harnest hatch` needs to scaffold into a project.

### Chick Structure

```
nest/<chick-name>/
  harnest.yaml                      # Team config (required)
  CLAUDE.md                         # Claude Code instructions (required)
  README.md                         # Chick documentation (required)
  claude/
    agents/*.md                     # Agent definitions (required)
    settings.json                   # Claude Code settings (required)
    settings.local.json.example     # Local overrides example (optional)
```

### Requirements

- **`harnest.yaml`**: Must define `team`, `agents`, `tools`, and `workflow` sections. See the `fullstack` chick for the schema.
- **`CLAUDE.md`**: Instructions injected into the project's `CLAUDE.md` on hatch. Should describe the team structure, workflow, and how to bootstrap the team.
- **`README.md`**: Documentation for the chick. Must include:
  - What the chick is for
  - Team roles table
  - Workflow description
  - Configuration options
  - Supplementary tool requirements
  - Limitations
- **Agent files**: One `.md` file per agent role in `claude/agents/`. Each file uses frontmatter for agent metadata (name, model, tools, permissions) and markdown body for instructions.
- **`settings.json`**: Claude Code settings including the teams experimental flag, permissions, and MCP server configurations.

### Guidelines

- Keep chicks focused — each chick should serve a clear use case.
- Use the `fullstack` chick as a reference for structure and conventions.
- Test your chick by running `harnest hatch --chick <name>` in a fresh directory.
- Document all supplementary tools and how to disable them.

## Project Structure

```
bin/harnest       CLI entrypoint (bash)
lib/              Shared libraries and assets
  harnest-parse-yaml.py       YAML → JSON parser (python3)
  harnest-tmux-protocol.md    Coordination protocol for tmux mode agents
  harnest-monitor.sh          Dashboard script for tmux monitor pane
nest/             Chick directories scaffolded by `harnest hatch`
```

### Tmux Mode Development

The `harnest fly` / `harnest land` commands implement tmux split-pane mode. Key files:

- **`bin/harnest`** — `cmd_fly` and `cmd_land` functions handle session lifecycle
- **`lib/harnest-parse-yaml.py`** — Parses `harnest.yaml` to JSON; uses PyYAML if available, fallback parser otherwise
- **`lib/harnest-tmux-protocol.md`** — Coordination protocol prepended to each agent's prompt
- **`lib/harnest-monitor.sh`** — Dashboard for the monitor pane; uses `jq` if available, `python3` fallback

To test tmux mode locally:
```bash
# From a clone of the repo
./bin/harnest fly "your test task"
# In another terminal
./bin/harnest land
```

## Code Style

- Shell scripts use `bash` with `set -euo pipefail`.
- Use the existing helper functions (`info`, `skip`, `warn`, `merge`) for user-facing output.
- Keep `bin/harnest` POSIX-friendly where possible.
- Use bird-centric terminology in all user-facing strings and comments.

## Reporting Issues

Open an issue at [github.com/gioperalto/harnest/issues](https://github.com/gioperalto/harnest/issues).
