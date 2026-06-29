#!/bin/bash
# ~/AUTO/paquetes/void-packages/update.sh
cd ~/AUTO/paquetes/void-packages
git fetch upstream

# Resolver conflicts automáticamente (modificar/eliminar → eliminar)
git merge upstream/master -X ours --no-commit
while git diff --name-only --diff-filter=U | grep -q .; do
    git diff --name-only --diff-filter=U | xargs git rm
done
git rm -r --cached srcpkgs/ 2>/dev/null
git commit -m "sync con void-packages upstream"
