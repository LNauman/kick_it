CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY'], 
      :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],
      :region                 => 'us-west-2',                  # optional, defaults to 'us-east-1'
      :host                   => 's3-us-west-2.amazonaws.com',             # optional, defaults to nil
      :endpoint               => 'https://s3-us-west-2.amazonaws.com' # optional, defaults to nil
    }
    config.fog_directory  = ENV['FOG_DIRECTORY']                     # required
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
end
