#!/bin/bash

TEMPLATE_URL=""
aws cloudformation create-stack \
    --stack-name RDS-state-scheduler  \
    --template-url ${TEMPLATE_URL}  \
    --capabilities CAPABILITY_IAM
