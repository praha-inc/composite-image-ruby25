# Composite Image Ruby2.5
Composite Image using Ruby2.5 and AWS Lambda
Then, Put AWS S3

# Prepare
Create AWS Account.
Then, You have to write AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY to .envrc

# Init
1. Install modules

```
$ bundle install --path vendor/bundle
```

2. Write .envrc

# Exec Local
```
$ bundle exec ruby lambda_function.rb
```

# Deploy to Lambda
## Prepare
You have to write AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY to ~/.aws/config
### Setup ~/.aws/config
```
$ aws configure
AWS Access Key ID: XXX
AWS Secret Access Key: xxxx
Default region name: ap-northeast-1
Default output format:
```

## Deploy
```
$ zip -r function.zip lambda_function.rb image_helper.rb assets vendor
$ aws lambda update-function-code --function-name CompositeImageRuby25 --zip-file fileb://function.zip
```

or, use deploy.sh
```
$ sh deploy.sh
```

## Refs
https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/ruby-package.html
