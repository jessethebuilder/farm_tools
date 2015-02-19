require 'spec_helper'

describe ContactInfo do

  describe 'Associations' do
    it{ should have_one :address }
    it{ should have_one :social_networking_profile}
  end

end