module ErrorsHelper
  def error_explanation(object, include_text_explanation: true, verb: 'saved', object_name: object.class.name.titlecase)
    render :partial => 'utilities/error_explanation', :locals => {:object => object,
                                                         :include_text_explanation => include_text_explanation,
                                                         :object_name => object_name,
                                                         :verb => verb}
  end

  def error_key_to_selector(key, klass_name)
    names = key.to_s.split('.')
    klasses = []
    names.each_with_index do |name, i|
      klasses << name
      klasses << 'attributes' unless i == (names.count - 1) || names.count == 1
    end
    "#{klass_name}_#{klasses.join('_')}"
  end
end