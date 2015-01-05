class CreateTestCompanies < ActiveRecord::Migration
  def change
    create_table :test_companies do |t|
      t.string :name
      t.integer :test_model_id

      t.timestamps
    end
  end
end
