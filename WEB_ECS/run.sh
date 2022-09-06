#!/bin/bash

# install
pip3 install awscli
sudo curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-darwin-amd64-latest
sudo chmod +x /usr/local/bin/ecs-cli
ecs-cli --version

# run
ecs-cli cli configure profile \
    --access-key xxx \
    --secret-key xxx \
    --profile-name hello-profile


ecs-cli configure \
    --cluster hello-cluster \
    --default-launch-type EC2 \
    --config-name hello-cluster-config \
    --region ap-northeast-2


ecs-cli up \
    --capability-iam \
    --size 1 \
    --instance-type t2.micro \
    --cluster-config hello-cluster-config \
    --ecs-profile hello-profile


ecs-cli compose up \
    --create-log-groups \
    --cluster-config hello-cluster-config \
    --ecs-profile hello-profile



# configuration
ecs-cli ps \
    --cluster-config hello-cluster-config \
    --ecs-profile hello-profile
