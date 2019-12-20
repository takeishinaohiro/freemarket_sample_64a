require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.credentials.acceess,
    aws_secret_access_key: Rails.application.credentials.secret,
    region: 'ap-northeast-1'
  }
  config.fog_directory  = 'freemarket-sample-64a'
  config.asset_host = 'https://freemarket-sample-64a.s3.amazonaws.com'
end