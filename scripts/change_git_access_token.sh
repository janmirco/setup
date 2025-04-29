#!/usr/bin/env bash

echo "Type root directory for searching Git repositories:"
read -r root_dir
echo "Type old access token:"
read -rs old_access_token
echo "Type new access token:"
read -rs new_access_token

fd --hidden --no-ignore --type directory '^.git$' "$root_dir" | xargs dirname | while IFS= read -r git_repo; do
    cd "$git_repo"
    url=$(git remote get-url origin 2>/dev/null)
    if [[ $? == 0 && "$url" == *"$old_access_token"* ]]; then
        new_url="${url//$old_access_token/$new_access_token}"
        git remote set-url origin "$new_url"
        echo "Updated remote URL: $new_url"
    fi
    cd - > /dev/null
done
