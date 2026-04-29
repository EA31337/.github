# Development Container

This directory contains the configuration for the project's [Development Container](https://containers.dev/).

## Overview

The dev container is based on Ubuntu Jammy and is configured to provide a consistent development environment with all necessary tools and extensions.

## Features

- **Languages & Runtimes:** Python, Node.js (via asdf), Docker-in-Docker.
- **Tools:** `gh` CLI, `ansible`, `pre-commit`, `actionlint`, `ripgrep`, `vim`, `make`.
- **VS Code Extensions:** Copilot, GitHub Actions, Markdown Mermaid, Markdownlint, Vim, and more.

## Provisioning

The container uses an Ansible playbook (`.devcontainer/provision.yml`) for system-level provisioning. This playbook handles:

- Installing essential APT packages (`git`, `gh`, `vim`, `direnv`, etc.).
- Installing Python requirements from `.devcontainer/requirements.txt`.
- Installing `ansible` via `pipx` and injecting required Python libraries.
- Installing Ansible collections from `requirements.yml` (if present).
- Setting up `pre-commit` hooks.

## Usage

1. Open the project in VS Code.
2. When prompted, click **Reopen in Container**.
3. Alternatively, use the command palette (`Ctrl+Shift+P`) and select **Dev Containers: Reopen in Container**.

The `onCreateCommand` in `devcontainer.json` will automatically trigger the Ansible provisioning when the container is first created.
