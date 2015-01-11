module Parts
  def quick_options(*options)
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

  def image_select(form_builder, object, uploader, version: :thumb)
    render :partial => 'utilities/image_select.html.erb', :locals => {:f => form_builder, :object => object,
                                                         :uploader => uploader, :version => version}
  end
end