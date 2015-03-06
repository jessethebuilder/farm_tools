class AddLeaflyFieldsToSocialNetworkingProfile < ActiveRecord::Migration
  def change
    add_column :social_networking_profiles, :leafly_app_id, :string
    add_column :social_networking_profiles, :leafly_app_key, :string
  end
end
