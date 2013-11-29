class AddAnAttrToGen < ActiveRecord::Migration
  def change
    add_column :gens, :an_attr, :string
  end
end
