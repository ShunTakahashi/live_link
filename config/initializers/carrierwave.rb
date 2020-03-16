require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
  }
  config.fog_public     = false
  config.cache_storage = :fog

  case Rails.env
  when 'production'
    config.fog_directory = 'livelink-production'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/livelink-production'
  when 'development'
    config.fog_directory = 'livelink-development'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/livelink-development'
  when 'test'
    config.fog_directory = 'livelink-test'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/livelink-test'
  end
end
