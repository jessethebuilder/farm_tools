class CreateGens < ActiveRecord::Migration
  def change
    create_table :gens do |t|
      t.text :fake_array

      t.timestamps
    end
  end
end
