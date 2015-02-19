class ContactInfo < ActiveRecord::Base
  belongs_to :has_contact_info, :polymorphic => true

  has_one :address, as: :has_address
  has_one :social_networking_profile, as: :has_social_networking_profile
end