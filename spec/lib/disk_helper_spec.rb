require 'spec_helper'

describe DiskHelper do
  describe '#DiskHelper.file_names(path, suffix_to_remove = '')' do
    it 'should return an Array' do
      DiskHelper.file_names('#').class.should == Array
    end

    it 'should return all of the file names in a path' do
      DiskHelper.file_names('C:/Users/bucky/desktop/jesseweb/farm_tools/farm_tools/spec/*.rb').should include('spec_helper.rb')
    end

    it 'should drop any suffix that is included as a parameter' do
      DiskHelper.file_names('C:/Users/bucky/desktop/jesseweb/farm_tools/farm_tools/spec/*.rb', ".rb").should include('spec_helper')
      DiskHelper.file_names('C:/Users/bucky/desktop/jesseweb/farm_tools/farm_tools/spec/*.rb', ".rb").should_not include ('spec_helper.rb')
    end
  end
end