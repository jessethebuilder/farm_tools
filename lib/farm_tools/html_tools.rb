module HtmlTools
  # include FacebookHelper
  #untested
  def for_select(collection, id_method, value_method, selected_items: nil)
    options = collection.each.collect{ |item| [item.send(id_method), item.send(value_method)] }
    if selected_ids
      options_for_select(options, selected_items)
    else
      options_for_select(options)
    end
  end

  def array_for_select(arr, selected_items: nil)
    options = arr.each.collect{ |i| [i.to_s.titlecase, i] }
    if selected_items
      options_for_select(options, selected_items)
    else
      options_for_select(options)
    end
  end

  def hash_for_select(hash, selected_items: nil)
    options = []
    hash.each{ |k, v| options << [v, k] }
    options_for_select(options, selected_items)
  end

  def array_of_hashes_for_select(array, id_key, value_key, selected_items: nil)
    options = array.collect{ |hash| [hash[id_key], hash[value_key]] }
    options_for_select(options, selected_items)
  end

  def remove_query_string(url)
    query_start = /\?/ =~ url
    url[0...query_start]
  end

  def meta_tags(h)
    html = ''
    h.each do |k, v|
      html += %Q|<meta property="#{k.to_s}" content="#{v}"|
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

  def canonical_link(url)
    %Q|<link rel="canonical" href="#{url}">|.html_safe
  end

  def head_info(title, description, image_url, resource_type, site_name, url = request.url,
                keywords: nil, facebook_app_id: nil, additional_meta_tags = {})
    html = "<title>#{title}</title>".html_safe
    html += facebook_meta_tags(title, description, image_url, resource_type, site_name, url, :facebook_app_id => facebook_app_id)
    html += canonical_link(url)
    html += meta_tags(:keywords => keywords) if keywords
    additional_meta_tags.each do |k, v|
      html += meta_tags(k => v)
    end
    content_for :head_info, html.html_safe
  end
end