#!/bin/bash
. venv/bin/activate
export VERSION=$(date "+%Y%m%d%H%M")
sed -i "s/99.0/99.0.$VERSION/" setup.py
TAG="$(git rev-parse --short HEAD)"
GIT_VERSION="$TAG $(date +%Y/%m/%d)"
echo $GIT_VERSION > kvirt/version/git
python3 -m build
twine upload --repository-url https://upload.pypi.org/legacy/ -u $PYPI_USERNAME -p $PYPI_PASSWORD --skip-existing dist/*
