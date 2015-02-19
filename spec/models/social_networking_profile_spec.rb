require 'spec_helper'

describe SocialNetworkingProfile do
  let(:snp){ build :social_networking_profile }
  describe "URL and ID Specs" do
    let(:fb_url){ "https://www.facebook.com/AnysoftSoftwareCompany" }

    describe 'Methods appended with _url' do
      describe "facebook_url" do
        it "should return a url to a facebook page" do
          snp.facebook_id = "AnysoftSoftwareCompany"
          snp.facebook_url.should == fb_url
        end


        it "should return nil if no :facebook_id exists" do
          snp.facebook_url.should == nil
        end
      end
    end

    describe "Methods appended with _url=" do
      describe "#facebook_url=(val)" do
        it 'should save the id within the url' do
          snp.facebook_url = fb_url
          snp.facebook_id.should == 'AnysoftSoftwareCompany'
        end

        it "should work properly, even if the 's' is left off of the 'http'" do
          snp.facebook_url = "http://www.facebook.com/AnysoftSoftwareCompany"
          snp.facebook_id.should == 'AnysoftSoftwareCompany'
        end

        it "should work properly with a query string attached" do
          snp.facebook_url = "#{fb_url}?query1=somestuff&blablabla=some-more-stuff"
          snp.facebook_id.should == "AnysoftSoftwareCompany"
        end

        it "should work properly with a trailing slash" do
          snp.facebook_url = "#{fb_url}/"
          snp.facebook_id.should == 'AnysoftSoftwareCompany'
        end


        it 'should raise an ArgumentError if val is not a url' do
          expect{ snp.facebook_url = "blablabla" }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
