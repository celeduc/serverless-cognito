#!/bin/sh
# marek kuczynski
# @marekq
# www.marek.rocks
# coding: utf-8

# zip the contents of the local dir excluding any git directories
zip -r serverless-cognito.zip . -x *.git* *.DS_Store*

# copy the zip to an s3 bucket
aws s3 cp serverless-cognito.zip s3://marek-serverless/

# deploy the cloudformation template to us-east-1
aws cloudformation deploy --template cognito-auth.yaml --stack-name cognitodemo --capabilities CAPABILITY_IAM --region us-east-1

# after 1-2 minutes, you can retrieve the login url from the cloudformation output