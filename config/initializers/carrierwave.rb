CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region:                ENV['AWS_REGION'],
    host:                  's3.eu-west-2.amazonaws.com',
    endpoint:              'https://s3.eu-west-2.amazonaws.com',
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME']
  config.fog_public     = true
  config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
end