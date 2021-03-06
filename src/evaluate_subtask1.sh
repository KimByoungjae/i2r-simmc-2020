DOMAIN=$1
ROOT=../data/simmc_$DOMAIN
TEST_SPLIT=${2:-devtest}
MODEL=${3:-"facebook/bart-large"}
JOINT_MODEL_NAME="${MODEL/facebook\//}"
OUTPUT_ROOT=../output/$DOMAIN/$JOINT_MODEL_NAME/$TEST_SPLIT

# Evaluate for devtest or teststd dataset
if [ $TEST_SPLIT == "devtest" ]
then
  python -m mm_action_prediction.tools.action_evaluation \
      --action_json_path="${ROOT}"/${DOMAIN}_${TEST_SPLIT}_dials_api_calls.json \
      --model_output_path="${OUTPUT_ROOT}"/dstc9-simmc-${TEST_SPLIT}-${DOMAIN}-subtask-1.json\
      --report_output_path="${OUTPUT_ROOT}"/dstc9-simmc-${TEST_SPLIT}-${DOMAIN}-subtask-1-report.json
else
  python -m mm_action_prediction.tools.action_evaluation \
      --action_json_path="${ROOT}"/${DOMAIN}_${TEST_SPLIT}_dials_api_calls.json \
      --model_output_path="${OUTPUT_ROOT}"/dstc9-simmc-${TEST_SPLIT}-${DOMAIN}-subtask-1.json \
      --report_output_path="${OUTPUT_ROOT}"/dstc9-simmc-${TEST_SPLIT}-${DOMAIN}-subtask-1-report.json\
      --single_round_evaluation
fi
