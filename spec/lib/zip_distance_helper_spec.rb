require 'spec_helper'
require '.\.\lib\farm_tools\zip_distance_helper.rb'
include ZipDistance

describe ZipDistance do
  describe '#zips_near(zip, radius, format = "miles")' do
    it 'should return every zip code in the radius' do
      zip_arr = zips_near(98362, 10)
      zip_arr.sort.should == ['98362', '98363'].sort
    end
  end
end