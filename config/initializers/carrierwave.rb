require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
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
  else
    config.storage :file # 開発環境:public/uploades下に保存
    config.enable_processing = false if Rails.env.test? #test:処理をスキップ
end