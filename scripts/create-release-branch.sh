RELEASE_BRANCH_NAME="$RELEASE_BRANCH_PREFIX$SPRINT_BRANCH"
git branch $RELEASE_BRANCH_NAME
git push --set-upstream origin $RELEASE_BRANCH_NAME