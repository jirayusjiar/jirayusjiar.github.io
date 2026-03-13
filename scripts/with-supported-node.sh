#!/usr/bin/env bash
set -euo pipefail

minimum_major=18

node_major() {
  node -p "process.versions.node.split('.')[0]" 2>/dev/null || true
}

current_major="$(node_major)"

if [[ -z "${current_major}" || "${current_major}" -lt "${minimum_major}" ]]; then
  for candidate in \
    "/usr/local/opt/node/bin" \
    "/opt/homebrew/opt/node/bin" \
    "/usr/local/opt/node@22/bin" \
    "/opt/homebrew/opt/node@22/bin" \
    "/usr/local/opt/node@20/bin" \
    "/opt/homebrew/opt/node@20/bin"
  do
    if [[ -x "${candidate}/node" ]]; then
      export PATH="${candidate}:$PATH"
      current_major="$(node_major)"
      if [[ -n "${current_major}" && "${current_major}" -ge "${minimum_major}" ]]; then
        break
      fi
    fi
  done
fi

current_major="$(node_major)"

if [[ -z "${current_major}" || "${current_major}" -lt "${minimum_major}" ]]; then
  echo "This project requires Node.js ${minimum_major}+ to run Astro." >&2
  echo "Current Node.js: $(node -v 2>/dev/null || echo 'not found')" >&2
  echo "Install or activate a newer Node.js version, then rerun the command." >&2
  exit 1
fi

exec "$@"
