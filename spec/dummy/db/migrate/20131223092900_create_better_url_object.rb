class CreateBetterUrlObject < ActiveRecord::Migration
  def change
    create_table :better_url_objects do |t|
      t.string :name
      t.string :for_url
    end
  end
end
