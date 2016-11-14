require 'aws-sdk'
# Rails.configuration.aws is used by AWS, Paperclip, and S3DirectUpload
#Rails.configuration.aws = YAML.load(ERB.new(File.read("#{Rails.root}/config/aws.yml")).result)[Rails.env].symbolize_keys!
Rails.configuration.aws = YAML.load(File.open("#{Rails.root}/config/aws.yml", 'r'))[Rails.env]
Aws.config.update({
  region:  'us-east-1',
  credentials: Aws::Credentials.new(
    Rails.configuration.aws['access_key_id'],
    Rails.configuration.aws['secret_access_key']
  ),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(Rails.configuration.aws['bucket'])
