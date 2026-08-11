#!/usr/bin/env bash
#
# interview-preparation-guide — local build / serve / deploy helper.
#
# Usage:
#   ./deploy.sh build          Build the site into _site/ (production baseurl)
#   ./deploy.sh serve          Serve the site locally at http://localhost:4000
#   ./deploy.sh serve-local    Serve locally without the GitHub Pages baseurl
#   ./deploy.sh deploy         Commit & push master (triggers GitHub Pages Actions)
#   ./deploy.sh status         Show working-tree status and last 5 runs of build logs
#   ./deploy.sh help           Show this help
#
# Environment:
#   BUILD_LOCAL=1   build without the GitHub Pages baseurl (for plain local preview)
#   NO_PUSH=1       with `deploy`, stage + commit but skip git push
#
set -euo pipefail

BASEURL="/interview-preparation-guide"
DEPLOY_BRANCH="master"

die() { echo "ERROR: $*" >&2; exit 1; }

require_command() { command -v "$1" >/dev/null 2>&1 || die "Missing required tool: $1"; }

install_gems() {
  require_command bundle
  echo "==> Installing gems (bundle install)"
  bundle install --quiet
}

cmd_build() {
  require_command bundle
  echo "==> Cleaning and building site"
  rm -rf _site
  if [[ "${BUILD_LOCAL:-0}" == "1" ]]; then
    bundle exec jekyll build
  else
    bundle exec jekyll build --baseurl "$BASEURL"
  fi
  echo "==> Build complete: _site/ ready to preview (open _site/index.html)"
}

cmd_serve() {
  local extra=""
  [[ "${1:-}" == "local" ]] && extra=""
  if [[ "${1:-}" == "local" ]]; then
    echo "==> Serving locally (no baseurl) at http://localhost:4000"
    bundle exec jekyll serve --livereload --trace
  else
    echo "==> Serving with baseurl $BASEURL — open http://localhost:4000$BASEURL"
    bundle exec jekyll serve --baseurl "$BASEURL" --livereload --trace
  fi
}

cmd_deploy() {
  require_command git
  local has_changes
  has_changes=$(git status --porcelain)
  if [[ -z "$has_changes" ]]; then
    echo "==> Nothing to commit — working tree is clean."
    exit 0
  fi

  echo "==> Staging all changes"
  git add -A

  local default_msg="docs: update interview preparation guide"
  if [[ -n "${1:-}" ]]; then
    default_msg="$*"
  fi
  echo "==> Committing: $default_msg"
  git commit -m "$default_msg"

  if [[ "${NO_PUSH:-0}" == "1" ]]; then
    echo "==> Committed but NO_PUSH=1 set — skipping git push"
  else
    echo "==> Pushing to origin/$DEPLOY_BRANCH (GitHub Actions will rebuild the site)"
    git push origin "$DEPLOY_BRANCH"
  fi
}

cmd_status() {
  require_command git
  echo "==> Working tree status"
  git status

  echo ""
  echo "==> Recent commits"
  git log --oneline -5

  echo ""
  echo "==> Recent GitHub Actions runs"
  if command -v gh >/dev/null 2>&1; then
    gh run list --limit 5 2>/dev/null || echo "(gh available but no run list; is the repo linked?)"
  else
    echo "(install GitHub CLI 'gh' to see workflow runs)"
  fi
}

cmd_help() {
  sed -n '2,/^#$/s/^# \{0,1\}//p' "${BASH_SOURCE[0]}"
}

sub="${1:-help}"
case "$sub" in
  install)  install_gems ;;
  build)    build=false; cmd_build ;;
  serve)    cmd_serve ;;
  serve-local) cmd_serve local ;;
  deploy)   shift || true; cmd_deploy "$@" ;;
  status)   cmd_status ;;
  help|-h|--help) cmd_help ;;
  *) die "Unknown subcommand '$sub'. Run ./deploy.sh help" ;;
esac