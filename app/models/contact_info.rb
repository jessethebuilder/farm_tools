class ContactInfo < ActiveRecord::Base
  belongs_to :has_contact_info, :polymorphic => true

  has_one :address, as: :has_address, :dependent => :destory
  has_one :social_networking_profile, as: :has_social_networking, :dependent => :destroy

  after_initialize{ |r| r.set_up_contact_info }

  def set_up_contact_info
    self.address = Address.new if address.nil?
    self.social_networking_profile = SocialNetworkingProfile.new if social_networking_profile.nil?
  end
end