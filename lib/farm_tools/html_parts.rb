module HtmlParts
  def quick_options(*options, ajax: false)
    html = initiate_quick_options
    html += '<ul class="quick_options">'

    options << yield if block_given?
    options.each do |o|
      html += '<li>'
      html += link_to o[0], o[1], remote: ajax
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

  def image_select(form_builder, image_attr, version: :thumb, alt_label: image_attr.to_s, multiple: false, accepts_remote_url: true)
    render :partial => 'utilities/image_select.html.erb', :locals => {:f => form_builder,
                                                          :image_attr => image_attr, :version => version,
                                                          :multiple => multiple, :accepts_remote => accepts_remote_url,
                                                          :alt_label => alt_label}
  end

  def mountable_image_select(form_builder)
    image_select(form_builder, :image, version: :thumb)
  end
end