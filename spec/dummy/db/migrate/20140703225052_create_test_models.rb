class CreateTestModels < ActiveRecord::Migration
  def change
    create_table :test_models do |t|
      t.string :string
      t.string :string2

      t.timestamps
    end
  end
end
