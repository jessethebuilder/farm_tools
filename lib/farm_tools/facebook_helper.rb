module FacebookHelper
    def fb_social_plugin(url, width = 700, fb_id = FACEBOOK_ID)
    render :partial => 'facebook_helper/social_plugin', :locals => {:url => url, :width => width, :fb_id => fb_id}
  end
end