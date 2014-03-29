module FacebookHelper
  def follow_on_facebook_button(related, width: '225px', colorscheme: 'light', layout: 'standard', show_faces: true)
    content_tag :div, '', :class => 'fb-follow', :href => "http://www.facebook.com/#{related}",
                       'data-colorscheme' => colorscheme, 'data-layout' => layout, 'data-show-faces' => show_faces,
                       'data-width' => width
  end

  def like_on_facebook_button(href, width: 100, layout: 'button_count', action: 'like', show_faces: true, share: true)
    content_tag :div, '', :class => 'fb-like', 'data-href' => href, 'data-width' => width,
                       'data-layout' => layout, 'data-action' => action,
                       'data-show-faces' => show_faces, 'data-share' => share
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

  def facebook_sdk(fb_id)
    html = '<div id="fb-root"></div>'
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