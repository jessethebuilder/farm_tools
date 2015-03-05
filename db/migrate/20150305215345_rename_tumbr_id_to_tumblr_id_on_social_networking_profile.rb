class RenameTumbrIdToTumblrIdOnSocialNetworkingProfile < ActiveRecord::Migration
  def change
    remove_column :social_networking_profiles, :tumbr_id, :string
    add_column :social_networking_profiles, :tumblr_id, :string
  end
end
