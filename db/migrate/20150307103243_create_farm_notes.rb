class CreateFarmNotes < ActiveRecord::Migration
  def change
    create_table :farm_notes do |t|
      t.integer :has_farm_notes_id
      t.string :has_farm_notes_type
      t.text :content

      t.timestamps null: false
    end
  end
end
