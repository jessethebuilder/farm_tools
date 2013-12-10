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
    options = arr.each.collect{ |i| [i, i.to_s.titlecase] }
    if selected_items
      options_for_select(options, selected_items)
    else
      options_for_select(options)
    end
  end
end