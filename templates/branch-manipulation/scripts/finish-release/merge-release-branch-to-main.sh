RELEASE_BRANCH_FULL_NAME=$RELEASE_BRANCH_PREFIX$RELEASE_BRANCH

git checkout main

git merge origin/$RELEASE_BRANCH_FULL_NAME --no-ff --no-commit
git commit -m "Merge branch 'origin/$RELEASE_BRANCH_FULL_NAME' into 'main'"
git push
