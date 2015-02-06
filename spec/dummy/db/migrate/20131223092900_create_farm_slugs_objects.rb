class CreateFarmSlugsObjects < ActiveRecord::Migration
  def change
    create_table :farm_slugs_objects do |t|
      t.string :name
      t.string :slug
    end
  end
end
