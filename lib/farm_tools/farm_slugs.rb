module FindForFarmSlugs
  def find(slug)
    if slug.to_i.to_s == slug.to_s
      #if the slug can be parsed as a simple integer. There is a validation that prevents
      #record from being saved as integers alone
      super(slug)
    else
      find_by_farm_slug(slug)
    end
  end

  def find_by_farm_slug(slug)
    r = where(@farm_slug_method => slug).limit(1)
    raise ActiveRecord::RecordNotFound, "with id: #{slug}" if r.empty?
    r.first
  end
end

class ActiveRecord::Base
  def self.use_farm_slugs(id_method: :name, slug_method: :slug)
    @farm_slug_method = slug_method
    build_instance_methods_for_farm_slugs(id_method, slug_method)

    extend FindForFarmSlugs

    validates id_method, :presence => true
    validate do
      #records cannot have simple integers for an id_method
      errors.add :name, "can't be a simple integer" if send(id_method).to_i.to_s == send(id_method).to_s
    end

    after_create{ |r| r.update_slug }
    #update :slug_method if a record is saved that has had changed made to the :id_method,
    #is NOT a new record, and if it passes validation
    after_validation{ |r| r.update_slug if r.changes[id_method] && !r.new_record? && r.errors.empty? }
  end

  private

  def self.build_instance_methods_for_farm_slugs(id_method, slug_method)
    instance_eval do
      define_method(:to_param) do
        self.send(slug_method)
        # if id_param = self.send(slug_method)
        #   id_param
        # else
        #   self.send(:id)
        # end
      end

      define_method(:update_slug) do
        update_attribute(slug_method, create_farm_slug(send(id_method)))
      end

      define_method(:create_farm_slug) do |val|
        v = val.parameterize
        if self.class.where(slug_method => v).empty?
          v
        else
          "#{v}_#{id}"
        end
      end
    end #end instance_eval
  end
end