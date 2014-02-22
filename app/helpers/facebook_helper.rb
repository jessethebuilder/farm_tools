module FacebookHelper
  #A few rules:
  # - if you opt to include the script, you MUST include a facebook app id.
  # - if you include the script, it includes the <div id="rb-root">, so if you include more than one script,
  #   set :include_root => false on each subsequent plugin+script after the first.

  def follow_on_facebook_button(related, width: '225px', colorscheme: 'light', layout: 'standard',
      show_faces: true, include_script: false, fb_id: nil, include_root: true)
    html = content_tag :div, '', :class => 'fb-follow', :href => "http://www.facebook.com/#{related}",
                       'data-colorscheme' => colorscheme, 'data-layout' => layout, 'data-show-faces' => show_faces,
                       'data-width' => width
    if include_script
      raise ArgumentError, 'You must specify an :app_id if you want to include the script' if fb_id.nil?
      html += follow_on_facebook_button_script(fb_id, :include_root => include_root)
    end
    html.html_safe
  end

  def follow_on_facebook_button_script(fb_id, include_root: true)
    html = ''
    html += '<div id="fb-root"></div>' if include_root
    html += '<script>(function(d, s, id) {
                       var js, fjs = d.getElementsByTagName(s)[0];
                       if (d.getElementById(id)) return;
                       js = d.createElement(s); js.id = id;
                       js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId='
    html += fb_id
    html += '";
             fjs.parentNode.insertBefore(js, fjs);
             }(document, \'script\', \'facebook-jssdk\'));</script>'
    html.html_safe
  end

  def like_on_facebook_button(href, width: 100, layout: 'button_count', action: 'like', show_faces: true, share: true,
      include_script: false, fb_id: nil, include_root: true)
    html = content_tag :div, '', :class => 'fb-like', 'data-href' => href, 'data-width' => width,
                       'data-layout' => layout, 'data-action' => action,
                       'data-show-faces' => show_faces, 'data-share' => share
    if include_script
      raise ArgumentError, 'You must specify an :app_id if you want to include the script' if fb_id.nil?
      html += like_on_facebook_button_script(fb_id, :include_root => include_root)
    end
    html.html_safe
  end

  def like_on_facebook_button_script(fb_id, include_root: true)
    html = ''
    html += '<div id="fb-root"></div>' if include_root
    html += '<script>(function(d, s, id) {
               var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId='
    html += fb_id
    html += '";
            fjs.parentNode.insertBefore(js, fjs);
            }(document, \'script\', \'facebook-jssdk\'));</script>'
    html.html_safe
  end

  def facebook_comments(href, width: 475, numposts: 10, colorscheme: 'light', include_script: false, fb_id: nil, include_root: true)
    html = content_tag :div, '', :class => 'fb-comments', 'data-href' => href, 'data-width' => width,
                       'data-numposts' => numposts, 'data-colorscheme' => colorscheme
    if include_script
      raise ArgumentError, 'You must specify an :app_id if you want to include the script' if fb_id.nil?
      html += facebook_comments_script(fb_id, :include_root => include_root)
    end
    html.html_safe
  end

  def facebook_comments_script(fb_id, include_root: true)
    html = ''
    html += '<div id="fb-root"></div>' if include_root
    html += '<script>(function(d, s, id) {
                      var js, fjs = d.getElementsByTagName(s)[0];
                      if (d.getElementById(id)) return;
                      js = d.createElement(s); js.id = id;
                      js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId='
    html += fb_id
    html += '";
              fjs.parentNode.insertBefore(js, fjs);
              }(document, \'script\', \'facebook-jssdk\'));</script>'
    html.html_safe
  end
end