module MountableImagesHelper
  def mountable_images=(image_files)
    image_files.each{ |f| mountable_images << MountableImage.new(:image => f) }
  end

  def remote_mountable_images_urls=(image_urls)
    urls = image_urls.to_s.split(/, ?/)
    urls.each{ |u| mountable_images << MountableImage.new(:remote_image_url => u)}
  end

  def mountable_images_cache(image_files)
    image_files.each{ |f| mountable_images << MountableImage.new(:image => f) }
  end
end