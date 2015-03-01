require 'spec_helper'
require '.\.\lib\farm_tools\zip_distance.rb'
include ZipDistance

describe ZipDistance do
  describe '#zips_near(zip, radius, format = "miles")' do
    it 'should return every zip code in the radius' do
      zip_arr = zips_near(98362, 5)
      #not a very comprehensive spec
      zip_arr.include?('98362').should == true
    end
  end
end