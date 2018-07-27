#!/bin/bash

TEMPLATE_URL=""
aws cloudformation create-stack \
    --stack-name EC2-state-scheduler  \
    --template-url ${TEMPLATE_URL}  \
    --capabilities CAPABILITY_IAM
