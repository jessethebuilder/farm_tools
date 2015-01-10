module RecordsFromModalHelper
  def new_record_from_modal(modal_title, new_partial, modal_element_id: 'express_modal')
    render :partial => 'utilities/records_from_modal/new', :locals => {:modal_element_id => modal_element_id,
                                                                      :modal_title => modal_title,
                                                                      :new_partial => new_partial}

  end
end