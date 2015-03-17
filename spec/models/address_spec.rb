require 'spec_helper'

describe Address do
  let(:address){ build :address }
  describe 'Associations' do
    it{ should belong_to :has_address }
  end

  describe 'Methods' do
    describe ':reverse_geocode' do
      #included from geocoder gem
      it 'should set return a city from a zip' do
        address.zip = '98362'
        address.geocode
        address.reverse_geocode
        address.city.should == 'Port Angeles'
      end
    end
  end
end
