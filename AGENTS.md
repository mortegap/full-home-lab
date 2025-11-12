# AGENTS.md - Coding Guidelines

## Build/Lint/Test Commands
- **Build**: `docker compose --profile <service> up -d`
- **Lint**: `yamllint *.yaml` for YAML files; `shellcheck *.sh` for Bash scripts; `docker-compose config` to validate compose files
- **Test**: No automated tests. Run single script: `./script.sh arg1 arg2 arg3`. Validate single compose: `docker-compose -f path/to/compose.yaml config`

## Code Style Guidelines
- **Imports/Formatting**: YAML: 2-space indentation, consistent quoting. Bash: 4-space indentation, no tabs.
- **Types/Naming**: Bash vars/functions: lowercase_snake_case. YAML keys: kebab-case. Env vars: UPPER_SNAKE_CASE.
- **Error Handling**: Bash: Use `set -e`, check `$?`, log errors to files. YAML: Validate with docker-compose config.
- **General**: Follow shellcheck/yamllint recommendations. Add comments for complex logic. No hardcoded secrets; use .env.

No Cursor or Copilot rules found.