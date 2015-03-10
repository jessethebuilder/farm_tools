require 'spec_helper'

RSpec.describe NewsStory, :type => :model do
  let(:story){ build :news_story }

  describe 'Db' do
    it{ should have_db_column(:published).with_options(:default => false) }
    it{ should have_db_column(:archived).with_options(:default => false) }
  end

  describe 'Validations' do
    it{ should validate_presence_of :title }
  end

  describe 'Associations' do
    # it{ should belong_to(:author).class_name('User') }
  end

  describe 'Idioms' do
    specify 'If a record is saved with archived => true, published will be set to false' do
      story.published = true
      story.archived = true
      story.published.should == false
    end

    specify 'If a record is saved with published => true, archived will be set to false' do
      story.archived = true
      story.published = true
      story.archived.should == false
    end
  end

  describe 'Methods' do
    describe '#publication_status' do
      specify 'if :published == true, publication_status == published' do
        story.published = true
        story.publication_status.should == 'published'
      end

      specify 'if :published == false AND :archived == false, publication_status should be "draft"' do
        story.published = false
        story.archived = false
        story.publication_status.should == 'draft'
      end

      specify 'if :archived == true, publication_status should be "archived"' do
        story.archived = true
        story.publication_status.should == 'archived'
      end

      specify 'a newly created object should be of type draft' do
        ns = NewsStory.new
        ns.publication_status.should == 'draft'
      end
    end
  end

  describe 'Class Methods' do
    let!(:pub){ create :published }
    let!(:draft){ create :draft }
    let!(:archive){ create :archive }

    describe '#records(show_drafts: false, show_archives: false, :hide_published => false)' do

      describe 'NewsStory.published' do
        it 'should only return published records' do
          NewsStory.published.count.should == 1
          NewsStory.published.first.should == pub
        end
      end

      describe 'NewsStory.drafts' do
        it 'should only return drafts' do
          NewsStory.drafts.count.should == 1
          NewsStory.drafts.last.should == draft
        end
      end

      describe 'NewsStory.archives' do
        it 'should only return archives' do
          NewsStory.archives.count.should == 1
          NewsStory.archives.last.should == archive
        end
      end

      describe 'NewsStory.active' do
        it 'should return published and drafts' do
          NewsStory.active.count.should == 2
          NewsStory.active.should_not include(archive)
        end
      end

      describe 'NewsStory.all' do
        it 'should return all News Stories, including archives' do
          NewsStory.all.count.should == 3
        end
      end
    end
  end
end
