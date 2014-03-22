module ErrorsHelper
  def error_explanation(object, include_text_explanation: true, verb: 'saved', object_name: object.class.name.titlecase)
    render :partial => '/error_explanation', :locals => {:object => object,
                                                         :include_text_explanation => include_text_explanation,
                                                         :object_name => object_name,
                                                         :verb => verb}
  end
end