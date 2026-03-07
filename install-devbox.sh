#!/usr/bin/env bash
set -euo pipefail

script_dir="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repo_root="${script_dir}"
target_dir="${1:-${HOME}/.local/bin}"
target_path="${target_dir}/devbox"

mkdir -p "${target_dir}"

printf '#!/usr/bin/env bash\nexec bash %q "$@"\n' "${repo_root}/devbox" > "${target_path}"
chmod 0755 "${target_path}"

cat <<EOF
Installed devbox to ${target_path}
The launcher points to ${repo_root}/devbox

If ${target_dir} is not on PATH, add this line to your shell profile:
export PATH="${target_dir}:\$PATH"

If you move this repository, rerun:
bash ./install-devbox.sh
EOF
