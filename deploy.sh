#!bin/sh

rm function.zip
zip -r function.zip lambda_function.rb image_helper.rb assets vendor
aws lambda update-function-code --function-name CompositeImageRuby25 --zip-file fileb://function.zip
