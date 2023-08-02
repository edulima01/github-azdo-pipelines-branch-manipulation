IS_TAG=$(echo $IS_TAG | tr '[[:upper:]]' '[[:lower:]]')

BRANCH_TYPE="branch"
REFS_PREFIX="refs/heads/"
if [[ "$IS_TAG" = "true" ]]; then
    BRANCH_TYPE="tag"
    REFS_PREFIX="refs/tags/"
fi

if [[ ! "$CURRENT_BRANCH" =~ $REFS_PREFIX$EXPECTED_BRANCH_PREFIX.* ]]; then
    echo "##vso[task.logissue type=error]Current $BRANCH_TYPE (${CURRENT_BRANCH#${REFS_PREFIX}}) does not have expected prefix ($EXPECTED_BRANCH_PREFIX)."
    exit 1
fi