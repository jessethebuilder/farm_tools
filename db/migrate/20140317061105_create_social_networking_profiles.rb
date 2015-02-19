class CreateSocialNetworkingProfiles < ActiveRecord::Migration
  def change
    create_table :social_networking_profiles do |t|
      #Columns with _id appended are the main identifiers for each social networking type, here and in subsequent
      # migrations. A column appended with _app_id refers to an api id.  
      t.string :facebook_app_id
      t.string :facebook_app_secret
      t.string :facebook_id

      t.string :twitter_app_id
      t.string :twitter_id

      t.string :has_social_networking_id
      t.string :has_social_networking_type

      t.string :tumbr_id
      t.string :google_plus_id
      t.string :pinterest_id
      t.string :instagram_id

      t.timestamps
    end
  end
end


#attr_accessor :address1, :address2, :city, :state, :zip, :phone, :website_url,
#              :facebook_url, :twitter_url, :google_plus_url, :pinterest_url, :tumblr_url, :instagram_url
