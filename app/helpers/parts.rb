module Parts
  def quick_options(options)
    html = initiate_quick_options
    #html += '<div class="row">'
    html += '<ul class="quick_options">'

    options << yield if block_given?
    options.each do |o|
      html += '<li>'
      html += link_to o[0], o[1]
      html += '</li>'
    end
    html += '</ul>'
    #html += '</div>'

    html.html_safe
  end

  def initiate_quick_options
    "<script>$(document).ready(function(){
                      quickOptionsBehaviors();
              })</script>"
  end
end