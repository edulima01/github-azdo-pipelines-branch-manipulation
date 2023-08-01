if [[ ! "$CURRENT_BRANCH" =~ refs/heads/$EXPECTED_BRANCH_PREFIX.* ]]; then
    echo "##vso[task.logissue type=error]Current branch (${CURRENT_BRANCH:11}) does not have expected prefix ($EXPECTED_BRANCH_PREFIX)."
    exit 1
fi