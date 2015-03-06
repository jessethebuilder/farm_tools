# encoding: utf-8

class MainNewsStoryImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [200, 200]
  end

  version :large_list do
    process :resize_to_fit => [300, 300]
  end

  version :large do
    process :resize_to_fit => [450, 450]
  end

  version :xlarge do
    process :resize_to_fit => [650, 650]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
