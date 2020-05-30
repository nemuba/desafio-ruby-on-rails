class ImageUploader < CarrierWave::Uploader::Base
   include Cloudinary::CarrierWave

  process :convert => 'png'

  version :thumb do
    process resize_to_fit: [100, 100]
  end
end
