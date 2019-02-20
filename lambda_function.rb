require 'json'
require 'aws-sdk-s3'
require './image_helper'

def lambda_handler(event:, context:)
  s3 = Aws::S3::Resource.new(region: 'ap-northeast-1')
  bucket_name = 'kukan-tech-tem'

  # Upload Image to S3
  file = ImageHelper.build(event['message']).tempfile.open.read
  s3.bucket(bucket_name).object('test.png').put(body: file)

  # Get Image from S3
  object = s3.bucket(bucket_name).object('test.png')
  {
    statusCode: 200,
    url: object.public_url,
  }
end

# for exec local
if __FILE__ == $0
  lambda_handler(event: { 'message' => 'Hello, PrAha!' }, context: nil)
end
