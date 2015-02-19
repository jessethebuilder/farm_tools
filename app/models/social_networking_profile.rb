class SocialNetworkingProfile < ActiveRecord::Base
  belongs_to :has_social_networking, :polymorphic => true

  def facebook_url=(val)
    #this and similar methods are designed to take a url in, parse it, and save the id
    #if the id is known, simply save it in the proper column (such as :facebook_id)
    val =~ /https?:\/\/www\.facebook\.com\/([^?^\/]+)/
    raise ArgumentError, "#{val} is not recognized as a valid Facebook url" if $~.nil?
    write_attribute(:facebook_id, $1)
  end

  def facebook_url
    facebook_id ? "https://www.facebook.com/#{facebook_id}" : nil
  end

  def twitter_url=(val)
    val =~ /https?:\/\/www\.twitter\.com\/([^?^\/]+)/
    raise ArgumentError, "#{val} is not recognized as a valid Twitter url" if $~.nil?
    write_attribute(:twitter_id, $1)
  end

  def twitter_url
    twitter_id ? "https://www.twitter.com/#{twitter_id}" : nil
  end

  def tumblr_url=(val)

  end

  def tumblr_url


  end

  private



end
