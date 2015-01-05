class TestCompany < ActiveRecord::Base
  belongs_to :test_model
  validates :name, :presence => true
end
