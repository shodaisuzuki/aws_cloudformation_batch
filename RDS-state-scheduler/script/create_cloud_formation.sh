#!/bin/bash

# example
# TEMPLATE_URL="https://s3-ap-northeast-1.amazonaws.com/cloud-formation/RDS_stete_scheduler/templates/RDS_state_scheduler.yaml"
TEMPLATE_URL=""
aws cloudformation create-stack \
    --stack-name RDS-state-scheduler  \
    --template-url ${TEMPLATE_URL}  \
    --capabilities CAPABILITY_IAM
