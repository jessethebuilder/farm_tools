class CreateFarmSlugTestObjects < ActiveRecord::Migration
  def change
    create_table :farm_slug_test_objects do |t|
      t.string :url_slug
      t.string :caption

      t.timestamps null: false
    end
  end
end
