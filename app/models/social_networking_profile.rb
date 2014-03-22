class SocialNetworkingProfile < ActiveRecord::Base
  belongs_to :has_social_networking, :polymorphic => true
end
