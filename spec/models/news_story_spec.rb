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
    #todo
    # specify 'error is raised if published is set directly' do
    #   expect{story.published = true}.to raise_error
    # end
    #
    # specify 'error is raised if archived is set directly' do
    #   expect{story.archived = true}.to raise_error
    # end

  end #Idioms

  describe 'Methods' do
    describe '#commit=(val)' do
      specify 'if val = "Publish," Record should save as published' do
        story.commit = :publish
        story.save
        story.publication_status.should == 'published'
        story.published.should == true
        story.archived.should == false
      end

      specify "if val == :draft, record should save as draft" do
        story.commit = :draft
        story.save
        story.publication_status.should == 'draft'
        story.published.should == false
        story.archived.should == false
      end

      specify 'if val == :archive, record should save as archive' do
        story.commit = :archive
        story.save
        story.publication_status.should == 'archived'
        story.published.should == false
        story.archived.should == true
      end

      specify 'If commit is set to draft, validations are skipped' do
        story.commit = :draft
        story.title = nil
        story.save
        story.id.should_not == nil
      end
    end

    describe '#publication_status' do
      specify 'if :published == true, publication_status == published' do
        story.send(:write_attribute, :published, true)
        story.publication_status.should == 'published'
      end

      specify 'if :published == false AND :archived == false, publication_status should be "draft"' do
        story.send(:write_attribute, :published, false)
        story.send(:write_attribute, :archived, false)
        story.publication_status.should == 'draft'
      end

      specify 'if :archived == true, publication_status should be "archived"' do
        story.send(:write_attribute, :archived, true)
        story.publication_status.should == 'archived'
      end

      specify 'a newly created object should be of type draft' do
        story = NewsStory.new
        story.publication_status.should == 'draft'
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
