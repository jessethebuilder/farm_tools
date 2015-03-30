class MountableImage < ActiveRecord::Base
  belongs_to :has_mountable_images, polymorphic: true

  mount_uploader :image, MountableImage, :ignore_integrity_errors => true
end
