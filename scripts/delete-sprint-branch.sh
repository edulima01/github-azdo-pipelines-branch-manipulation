git push origin --delete $SPRINT_BRANCH
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$CURRENT_BRANCH" == "$SPRINT_BRANCH" ]]; then
    git checkout main
fi
git branch -D $SPRINT_BRANCH
