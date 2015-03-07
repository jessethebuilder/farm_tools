require 'spec_helper'

describe 'FarmSlugs' do
  #FarmSlugs is provided through a monkey patch on ActiveRecord::Base
  let(:fso){ build :farm_slugs_object }

  describe '#use_farm_slugs' do

    describe 'Validations' do
      it 'should validate presence of :id_method' do
        fso.name = nil
        fso.valid?
        fso.errors.messages[:name].include?("can't be blank").should == true
      end

      it 'should validate that :id_method is not a simple integer' do
        fso.name = '123'
        fso.valid?
        fso.errors.messages[:name].include?("can't be a simple integer").should == true
      end
    end #end Validations

    it 'should save a parameterized version of :id_method to the :slug_method attribute' do
      fso.name = 'Farm Slug Test Name'
      fso.save
      fso.slug.should == 'farm-slug-test-name'
      fso.slug.should == 'Farm Slug Test Name'.parameterize
    end

    it 'should append the :id, if identical names are used' do
      test_name = 'Farm Slug Test Name'
      fso.name = test_name
      fso.save

      new_fso = FarmSlugsObject.new name: test_name.upcase
      new_fso.save
      fso.slug.should_not == new_fso.slug
      new_fso.slug.should == "#{fso.slug}_#{new_fso.id}"
    end

    it 'should not append :id on update' do
      fso.save
      old_slug = fso.slug
      fso.save
      fso.slug.should == old_slug
    end

    it 'should change :slug if :name gets changed' do
      fso.save
      new_name = 'A new name for this funny object'
      fso.name = new_name
      fso.save
      fso.slug.should == new_name.parameterize
    end
  end #end use_farm_slugs

  describe 'ActiveRecord method overrides' do
    let(:name){ 'ActiveRecord method overrides object name' }
    before(:each) do
      fso.name = name
      fso.save
    end

    describe '#to_param' do
      it 'should return the slug' do
        fso.to_param.should == name.parameterize
      end
    end

    describe '#find(slug/val)' do
      it 'should find the object by slug' do
        FarmSlugsObject.find('ActiveRecord method overrides object name'.parameterize).should == fso
      end

      it 'should raise a record not found error if the slug does not match a record' do
        expect{ FarmSlugsObject.find('aklsfdji3n12`92imciis adf') }.to raise_error(ActiveRecord::RecordNotFound)
      end

      it 'should find a record by id, if an integer is passed' do
        FarmSlugsObject.find(fso.id).should == fso
      end
    end
  end

  describe 'Overriding method name defaults' do
    pending
  end


  before(:each) do
    #fso.class_eval{ use_farm_slugs }
  end
end


