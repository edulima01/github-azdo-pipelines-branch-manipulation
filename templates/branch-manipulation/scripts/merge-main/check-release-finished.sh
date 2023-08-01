if [[ ! "$MERGE_MESSAGE" =~ ^Merge[[:space:]]branch[[:space:]]\'origin/release/[[:digit:]]{2}-$SQUAD_NAME\'[[:space:]]into[[:space:]]\'main\'$ ]]; then
    exit 0
fi
echo "##vso[task.setvariable variable=isMergeNecessary;]false"

CURRENT_BRANCH_NAME=$(echo $MERGE_MESSAGE | awk -F"'" '{print $2}')
CURRENT_BRANCH_NAME=${CURRENT_BRANCH_NAME:7}

CURRENT_BRANCH_NAME=${CURRENT_BRANCH_NAME#release/}

CURRENT_SPRINT=${CURRENT_BRANCH_NAME:0:2}
CURRENT_SQUAD=${CURRENT_BRANCH_NAME:3}
((CURRENT_SPRINT+=1))
printf -v PADDED_SPRINT "%02d" $CURRENT_SPRINT
CREATE_BRANCH_NAME="$SPRINT_BRANCH_PREFIX$PADDED_SPRINT-$CURRENT_SQUAD"

source ./templates/branch-manipulation/scripts/create-branch.sh

git checkout main
