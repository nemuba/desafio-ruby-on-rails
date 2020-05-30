class LogoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'png'

  version :thumb do
    process resize_to_fit: [50, 50]
  end

end
