class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string :phone
      t.string :phone2
      t.string :phone3
      t.string :main_email
      t.string :billing_email
      t.string :website_url

      t.integer :has_contact_info_id
      t.string :has_contact_info_type
    end
  end
end
