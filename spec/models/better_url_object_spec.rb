#require 'spec_helper'
#
#describe BetterUrlObject do
#  let(:bu){ create :better_url_object }
#  describe '#for_url' do
#    it 'should be parameterized version of name' do
#      bu.save!
#      bu.for_url.should == bu.name.parameterize
#    end
#
#    it 'should be updated whenever #name is saved or updated' do
#      bu.update_attributes(:name => 'Test 1')
#      bu.for_url.should == 'Test 1'.parameterize
#      bu.update(:name => 'Test 2')
#      bu.for_url.should == 'Test 2'.parameterize
#      bu.name = 'Test 3'
#      bu.save!
#      bu.for_url.should == 'Test 3'.parameterize
#      bu.send(:write_attribute, :name, 'Test 4')
#      bu.save
#      bu.for_url.should == 'Test 4'.parameterize
#    end
#
#    it 'should validate uniqueness of value' do
#      bu.should validate_uniqueness_of(:for_url)
#    end
#
#
#  end #for_url
#
#  describe '#to_param' do
#
#  end #to_param
#
#end