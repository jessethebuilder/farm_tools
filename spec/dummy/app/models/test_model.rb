class TestModel < ActiveRecord::Base


  validates :string, :presence => true
  has_one :test_company
  accepts_nested_attributes_for :test_company
end
