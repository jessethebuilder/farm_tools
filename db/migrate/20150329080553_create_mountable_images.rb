class CreateMountableImages < ActiveRecord::Migration
  def change
    create_table :mountable_images do |t|
      t.string :image
      t.string :label
      t.text :description
      t.integer :has_mountable_images_id
      t.string :has_mountable_images_type

      t.timestamps null: false
    end
  end
end
