class Gen < ActiveRecord::Base
  acts_like_an_array :fake_array
  has_many :addresses, :as => :has_address
end
