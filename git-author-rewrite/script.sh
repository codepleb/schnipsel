#!/bin/sh

FOLDER="hp.git"

git clone --bare https://github.com/codepleb/$FOLDER

cd $FOLDER

git filter-branch --env-filter '

CORRECT_NAME="XYZ"
CORRECT_EMAIL="XZY@gmail.com"

export GIT_COMMITTER_NAME="$CORRECT_NAME"
export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
export GIT_AUTHOR_NAME="$CORRECT_NAME"
export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
' --tag-name-filter cat -- --branches --tags

git config credential.helper store
git push --force --tags origin 'refs/heads/*'

