ORIGIN_NAME=${INTEGRATION_BRANCH#refs/heads/}
DESTINATION_NAME=${ORIGIN_NAME#${INTEGRATION_BRANCH_PREFIX}}

echo "##vso[task.setvariable variable=integrationBranchOriginName;]$ORIGIN_NAME"
echo "##vso[task.setvariable variable=integrationBranchDestinationName;]$DESTINATION_NAME"