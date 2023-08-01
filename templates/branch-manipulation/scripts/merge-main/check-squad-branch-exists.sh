BRANCH_NAME=$(git branch --list "origin/$BRANCH_PREFIX*-$SQUAD_NAME" --remote --sort=-committerdate)
if [[ -z "$BRANCH_NAME" ]]; then
    exit 0
fi

for BRANCH in $BRANCH_NAME; do
    BRANCH=${BRANCH:7}
    echo "##vso[task.setvariable variable=mergeBranchName;]$BRANCH"
    exit 0
done