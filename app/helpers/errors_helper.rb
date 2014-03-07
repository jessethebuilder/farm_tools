module ErrorsHelper
  def error_explanation(object, include_explanation: true, verb: 'saved', object_name: object.class.name.titlecase)
    render :partial => '/error_explanation', :locals => {:object => object,
                                                         :include_explanation => include_explanation,
                                                         :object_name => object_name,
                                                         :verb => verb}
  end
end