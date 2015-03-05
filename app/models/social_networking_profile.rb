class SocialNetworkingProfile < ActiveRecord::Base
  belongs_to :has_social_networking, :polymorphic => true

  def facebook_url=(val)
    #this and similar methods are designed to take a url in, parse it, and save the id
    #if the id is known, simply save it in the proper column (such as :facebook_id)
    val =~ /https?:\/\/www\.facebook\.com\/([^?^\/]+)/
    #raise ArgumentError, "#{val} is not recognized as a valid Facebook url" if $~.nil?
    write_attribute(:facebook_id, $1)
  end

  def facebook_url
    facebook_id ? "https://www.facebook.com/#{facebook_id}" : nil
  end

  def facebook_icon(image_url, use_text_label: false)
    # html = %Q|<a href="#{facebook_url}" target="_blank">|
    # html += %Q|<img src="#{image_url}" alt="Facebook">|
    # html += " Facebook" if use_text_label
    # html += '</a>'
    # html.html_safe

    social_networking_icon('facebook', image_url, :use_text_label => use_text_label)
  end

  def twitter_url=(val)
    val =~ /https?:\/\/www\.twitter\.com\/([^?^\/]+)/
    #raise ArgumentError, "#{val} is not recognized as a valid Twitter url" if $~.nil?
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

  def social_networking_icon(network, image_url, use_text_label: false)
    html = %Q|<a href="#{eval("#{network.downcase}_url")}" target="_blank">|
    html += %Q|<img src="#{image_url}" alt="#{network.titlecase}">|
    html += network.titlecase if use_text_label
    html += '</a>'
    html.html_safe
  end
end
