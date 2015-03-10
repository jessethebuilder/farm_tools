#the publish_or_archive record needs to be added to the beginning of :create and :update
#set_[instance_variable] needs to be modified to make a new object if params[:id] is not found.

#Follow directions at the top of each module.

module SaveDraftArchiveDelete
  #extend in model
  def save_draft_archive_delete
    #requires that record has column :archived and column :published. Both should default to false
    instance_eval do
      #modify published and archived setters
      define_method(:published=) do |value|
        write_attribute(:archived, false) if value
        super(value)
      end

      define_method(:archived=) do |value|
        write_attribute(:published, false) if value
        super(value)
      end

      define_method(:publication_status) do
        if published?
          val = 'published'
        else
          val = archived? ? 'archived' : 'draft'
        end
        val
      end
    end
  end

  #def records(show_drafts: false, show_archives: false, hide_published: false, order: nil)
  #  if hide_published
  #    r = empty_query
  #  else
  #    r = published
  #  end
  #
  #  r << drafts if show_drafts
  #  r << archives if show_archives
  #  #r = r + drafts if show_drafts
  #  #r = r + archives if show_archives
  #  r.order(order)
  #end
  #
  # def empty_query
  #   where('published = true AND archived = true')
  # end

  def published
    where(:published => true)
  end

  def drafts
    where('published = ? AND archived = ?', false, false)
  end

  def archives
    where(:archived => true)
  end

  def active
    where(:archived => false)
  end
end


module SaveDraftArchiveDeleteControllerHelper
  #include in controller

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