BRANCH_NAME=$(git branch --list "origin/$BRANCH_PREFIX*-$SQUAD_NAME" --remote)
if [[ -z "$BRANCH_NAME" ]]; then
    exit 0
fi

BRANCH_NAME=${BRANCH_NAME:7}
echo "##vso[task.setvariable variable=mergeBranchName;]$BRANCH_NAME"