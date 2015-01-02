module SaveDraftArchiveDeleteHelper
  def button_row(record, form_builder)
    render :partial => 'utilities/publish_draft_archive_delete_button_row', :locals => {:record => record, :f => form_builder}

  end
end