git checkout $DESTINATION_BRANCH

git merge --no-ff --no-commit origin/$ORIGIN_BRANCH
if [[ "$?" == "1" ]]; then
    git reset --hard
    git checkout $ORIGIN_BRANCH
    echo "##vso[task.setvariable variable=mergeHasConflicts;]true"
    echo "##vso[task.logissue type=error]There are conflicts between origin $ORIGIN_BRANCH and destination $DESTINATION_BRANCH. Automatic merge is aborted."
    exit 1
fi

git commit -m "Merge ${BRANCH_TYPE:-branch} 'origin/$ORIGIN_BRANCH' into '$DESTINATION_BRANCH'"
git push

git checkout $ORIGIN_BRANCH

echo "##vso[task.setvariable variable=mergeHasConflicts;]false"
