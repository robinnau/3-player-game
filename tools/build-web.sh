#!/usr/bin/env bash
# Builds the standalone web version (docs/index.html, served by GitHub Pages)
# from index.html, the source that is also published as the claude.ai artifact.
set -euo pipefail
cd "$(dirname "$0")/.."
{
  printf '%s\n' '<!doctype html><html lang="de"><head><meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">' \
    '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px);box-sizing:border-box}body{margin:0;font:14px system-ui,sans-serif}img{max-width:100%}[hidden]{display:none!important}</style>' \
    '</head><body>'
  cat index.html
  printf '%s\n' '</body></html>'
} > docs/index.html
touch docs/.nojekyll
echo "docs/index.html built"
