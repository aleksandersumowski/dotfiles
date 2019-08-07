#!/bin/sh

for branch in $(git branch -a | sed 's/^\s*//' | sed 's/^remotes\///' | grep -v 'master$'); do
  last_commit_msg="$(git log --oneline --format=%f -1 $branch)"
  if [[ "$(git log --oneline --format=%f | grep $last_commit_msg | wc -l)" -eq 1 ]]; then
    if [[ "$branch" =~ "origin/" ]]; then
      local_branch_name=$(echo "$branch" | sed 's/^origin\///')
      if [[ -n "$EXEC" ]]; then
        git push origin :$local_branch_name
      else
        echo "git push origin :$local_branch_name"
      fi
    else
      if [[ -n "$EXEC" ]]; then
        git branch -D $branch
      else
        echo "git branch -D $branch"
      fi
    fi
  fi
done
