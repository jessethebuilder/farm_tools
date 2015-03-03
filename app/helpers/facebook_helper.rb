module FacebookHelper
  def facebook_sdk(app_id)
    #this must be included to use any of these functions. Place just after opening <body> tag.
    render :partial => 'facebook_helper/facebook_sdk', :locals => {:app_id => app_id}
  end


  def follow_on_facebook_button(related, width: '225px', colorscheme: 'light', layout: 'standard', show_faces: true)
    #layouts are "standard", "box_count", "button_count", "button"
    content_tag :div, '', :class => 'fb-follow', :href => "http://www.facebook.com/#{related}",
                       'data-colorscheme' => colorscheme, 'data-layout' => layout, 'data-show-faces' => show_faces,
                       'data-width' => width
  end

  def like_on_facebook_button(href: request.url, width: 100, layout: 'button_count', action: 'like', show_faces: true, share: true)
    content_tag :div, '', :class => 'fb-like', 'data-href' => href, 'data-width' => width,
                       'data-layout' => layout, 'data-action' => action,
                       'data-show-faces' => show_faces, 'data-share' => share
  end

  def facebook_comments(href, width: 475, numposts: 10, colorscheme: 'light')
    html = content_tag :div, '', :class => 'fb-comments', 'data-href' => href, 'data-width' => width,
                       'data-numposts' => numposts, 'data-colorscheme' => colorscheme
    html.html_safe
  end



  # def facebook_sdk(fb_id, turbolinks: false)
  #   unless turbolinks
  #     html = %Q|<meta propty="fb:app_id" content="#{fb_id}">|
  #     html += '<div id="fb-root"></div>'
  #     html += '<script>(function(d, s, id) {
  #                       var js, fjs = d.getElementsByTagName(s)[0];
  #                       if (d.getElementById(id)) return;
  #                       js = d.createElement(s); js.id = id;
  #                       js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId='
  #     html += fb_id
  #     html += '";
  #               fjs.parentNode.insertBefore(js, fjs);
  #               }(document, \'script\', \'facebook-jssdk\'));</script>'
  #   else
  #     html = javascript_include_tag 'facebook_sdk_for_turbolinks'
  #   end
  #
  #
  #   html.html_safe
  # end



  def facebook_meta_tags(title, description, image_url, resource_type, site_name, url = request.url)
    html = %Q|<meta property="og:title" content="#{title}">|
    html += %Q|<meta property="og:url" content="#{url}">|
    html += %Q|<meta property="og:type" content="#{resource_type}">|
    html += %Q|<meta property="og:image" content="#{image_url}">|
    html += %Q|<meta property="og:site_name" content="#{site_name}">|
    html += %Q|<meta property="og:description" content="#{facebook_description(description)}">|
    html.html_safe
    #html = content_tag :meta, '', :property => 'og:title', :content => title
    #html += content_tag(:meta, '', :property => 'og:image', :content => image_url)
    #%Q|<meta property="og:type" content="website">|.html_safe
    #html += content_tag(:meta, '', :property => 'og:type', :content => 'website')
    #html += content_tag(:meta, '', :property => 'og:url', :content => url)
    #html.html_safe
  end

  def facebook_description(str)
    #facebook doesn't like line breaks, so this prints out str until it hits the first <br> or <br /> -- /<br( \/)?>/
    index = /<br( \/)?>/ =~ str
    index ? str[0..(index - 1)] : str
  end


end