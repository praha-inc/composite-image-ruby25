require 'json'
require 'aws-sdk-s3'
require './image_helper'

def lambda_handler(event:, context:)
  s3 = Aws::S3::Resource.new(region: 'ap-northeast-1')
  bucket_name = 'YOUR_BUCKET_NAME'
  file_name = 'helloworld.png'

  # Upload Image to S3
  file = ImageHelper.build(event['message']).tempfile.open.read
  s3.bucket(bucket_name).object(file_name).put(body: file)

  # Get Image from S3
  object = s3.bucket(bucket_name).object(file_name)
  {
    statusCode: 200,
    url: object.public_url,
  }
end

# for exec local
if __FILE__ == $0
  lambda_handler(event: { 'message' => 'Hello, PrAha!' }, context: nil)
end
