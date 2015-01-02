module HtmlTools
  #untested
  def for_select(collection, id_method, value_method, selected_ids = nil)
    options = collection.each.collect{ |item| [item.send(id_method), item.send(value_method)] }
    if selected_ids
      options_for_select(options, selected_ids)
    else
      options_for_select(options)
    end
  end

  def array_for_select(arr, selected_items = nil)
    options = arr.each.collect{ |i| [i.to_s.titlecase, i] }
    if selected_items
      options_for_select(options, selected_items)
    else
      options_for_select(options)
    end
  end

  def remove_query_string(url)
    query_start = /\?/ =~ url
    url[0...query_start]
  end

  def meta_tags(h)
    html = ''
    h.each do |k, v|
      html += %Q|<meta property="#{k.to_s}" content="#{v}"|
      #html += content_tag(:meta, '', :content => v, :property => k.to_s, )
    end
    html.html_safe
  end

  def to_li(container, *opts)
    html = ''
    container.each do |i|
      html += content_tag(:li, i, opts)
    end
    html.html_safe
  end
end