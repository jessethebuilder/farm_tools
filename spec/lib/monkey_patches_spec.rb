require 'spec_helper'

describe 'monkey_patches.rb' do
  let(:gen){ FactoryGirl.build :gen }

  describe 'ActiveRecord::Base' do
    describe '#acts_like_an_array' do
      it 'should save as an array' do
        gen.fake_array.should == []
        gen.fake_array = %w|test1 test2|
        gen.fake_array.should == ['test1', 'test2']
      end

      specify 'add + _method_name should all one to pass a value as an array or as a single value to acts_like_an_array attribute' do
        gen.add_fake_array('test1')
        gen.fake_array.should == ['test1']
        gen.add_fake_array(['test2', 'test3'])
        gen.fake_array.should == ['test1', 'test2', 'test3']
      end
    end

    describe '#convert_blanks_to_nils(*attrs)' do
      it 'should convert any attribute sent it to nil if blank' do
        gen.an_attr = ''
        gen.convert_blank_to_nil :an_attr
        gen.an_attr.should be_nil
      end
    end
  end

  describe 'Array' do
    describe '#match_at' do
      a = %w|abc 123 xyz|
      specify 'it should return the index position of the FIRST item that matches regex' do
        a.match_at(/b/).should == 0
      end

      specify 'it should work with strings as well' do
        a.match_at('2').should == 1
      end

      specify 'should return nil if no match is found' do
        a.match_at('h').should == nil
      end
    end
  end


end