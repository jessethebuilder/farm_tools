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
    let(:arr){ [1,2,3,4] }

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

    describe '#move(to, from)' do

      it 'should change the order of elements in an array by their index value' do
        arr.move(2, 3).should == [1,2,4,3]
        arr.should == [1,2,3,4]
      end

      it 'should work regardless of how the move function is ordered' do
        arr.move(3, 2).should == [1, 2, 4, 3]
      end

      it 'should work if there are identical values in the array' do
        arr2 = [1, 1, 2, 2]
        arr2.move(1, 2).should == [1, 2, 1, 2]
      end

      it 'should return an Arry identical to the original if to == from' do
        arr.move(1, 1).should == [1, 2, 3, 4]
      end

      it 'should raise an error of to or from is out of array range' do
        expect{ arr.move(10, 1) }.to raise_error(IndexError, /from parameter/)
        expect{ arr.move(1, 10) }.to raise_error(IndexError, /to parameter/)
      end

      specify '! version mutates original array' do
        arr.move!(2, 3)
        arr.should == [1,2,4,3]
      end
    end

    describe '#out_of_range?(index)' do
      it 'should return true if index is out of range' do
        arr.out_of_range?(4) == true
        arr.out_of_range?(3) == false
      end

      it 'should return true if index goes below 0' do
        arr.out_of_range?(-1) == true
      end
    end
  end


end