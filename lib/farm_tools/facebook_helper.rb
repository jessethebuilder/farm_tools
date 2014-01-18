module FacebookHelper
    def fb_social_plugin(url, width = 700, fb_id = FACEBOOK_ID, color = 'light')
    render :partial => '/app/views/facebook_helper/_social_plugin.html.erb',
           :locals => {:url => url, :width => width, :fb_id => fb_id, :color => color}
  end
end