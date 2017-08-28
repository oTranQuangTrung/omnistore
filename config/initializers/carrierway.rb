CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage :file
  else
    # config.storage :fog
    # config.fog_credentials = {
    #   provider:                "AWS",
    #   aws_access_key_id:       ENV["COWORKING_AWS_ACCESS_KEY_ID"],
    #   aws_secret_access_key:   ENV["COWORKING_AWS_SECRET_ACCESS_KEY"],
    #   region:                  ENV["COWORKING_AWS_REGION"],
    #   path_style:              true
    # }
    # config.fog_directory  = ENV['COWORKING_S3_BUCKET_NAME']
    # config.fog_public = Settings.carrierwave.fog_public
    # config.fog_attributes = {
    #   "Cache-Control" => "max-age=#{eval(Settings.carrierwave.fog_cache_control).to_i}"
    # }
    # config.asset_host = ENV["COWORKING_CLOUDFRONT_DOMAIN_NAME"]
    config.storage :file
  end
end
