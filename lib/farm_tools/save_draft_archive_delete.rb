module SaveDraftArchiveDelete
  #extend in model
  def save_draft_archive_delete
    #requires that record has column :archived and column :published. Both should default to false
    instance_eval do
      define_method(:published=) do |value|
        write_attribute(:archived, false) if value
        super(value)
      end

      define_method(:archived=) do |value|
        write_attribute(:published, false) if value
        super(value)
      end
    end
  end

  def records(show_drafts: false, show_archives: false, hide_published: false)
    if hide_published
      r = empty_query
    else
      r = where(:published => true)
    end

    r = r + drafts if show_drafts
    r = r + archives if show_archives
    r
  end

  def empty_query
    where('published = true AND archived = true')
  end

  def published
    where(:published => true)
  end

  def drafts
    where('published = false AND archived = false')
  end

  def archives
    where(:archived => true)
  end
end


module SaveDraftArchiveDeleteControllerHelper
  #include in controller
  #the publish_or_archive record needs to be added to the beginning
  def publish?
    params[:commit] == 'Publish'
  end

  def archive?
    params[:commit] == 'Archive'
  end

  def publish_or_archive(record)
    record.update_attribute(:published, publish?)
    record.update_attribute(:archived, archive?)
  end
  #
  #def self.included(base)
  #  /(.+)Controller\Z/ =~ base.name
  #  class_name = $1.singularize.underscore
  #  #base.class_eval do
  #    define_method("set_#{class_name}".to_sym) do
  #      if params[:id]
  #        eval("@#{class_name} = find(params[:id])")
  #      else
  #        eval("@#{class_name} = new")
  #      end
  #    end
  #  #end
  #
  #  #base.instance_eval do
  #  #  end
  #  ##end
  #end
end