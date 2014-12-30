module TwitterHelper
  def tweet_button(tweet, related, url: '', count: 'horizontal', via: '', lang: 'en', include_script: false)
    html = content_tag :a, 'Tweet #TwitterStories', :href => "https://twitter.com/share?text=#{tweet}", :class => 'twitter-share-button',
                       'data-lang' => lang,
                       'data-related' => related, 'data-url' => url, 'data-count' => count, 'data-via' => via
    html += "<script>#{tweet_button_script}</script>".html_safe if include_script
    html
  end

  def follow_on_twitter_button(related, link_text: "Follow @#{related}", size: 'medium', show_count: false,
      lang: 'en', include_script: false)
    html = content_tag :a, link_text, :href => "http://www.twitter.com/#{related}", :class => 'twitter-follow-button',
                       'data-size' => size, 'data-show-count' => show_count, 'data-lang' => lang
    #html += "<script>#{follow_on_twitter_button_script}</script>".html_safe if include_script
    html += twitter_script if include_script
    html
  end

  def twitter_script
    '<script src="//platform.twitter.com/widgets.js"></script>'.html_safe
  end

  def tweet_button_script
    #'<script src="//platform.twitter.com/widgets.js"></script>'.html_safe
    '!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="https://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");'.html_safe
  end

  def follow_on_twitter_button_script
    #'<script src="//platform.twitter.com/widgets.js"><script>'
    '!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");'.html_safe
  end
end
