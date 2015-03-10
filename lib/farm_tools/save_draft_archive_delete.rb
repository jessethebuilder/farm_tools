#the publish_or_archive record needs to be added to the beginning of :create and :update
#set_[instance_variable] needs to be modified to make a new object if params[:id] is not found.

#Follow directions at the top of each module.

module SaveDraftArchiveDelete
  #extend in model



  # self.extended do todo
  def save_draft_archive_delete
    #requires that record has column :archived and column :published. Both should default to false


    instance_eval do
      #modify published and archived setters
      # define_method(:published=) do |value|
      #   write_attribute(:published, value)
      #   write_attribute(:archived, !value)
        # write_attribute(:archived, false) if value
        # write_attribute(:published, true) if value
        # super(value)
      # end

      # define_method(:archived=) do |value|
      #   write_attribute(:published, !value)
        # write_attribute(:published, false) if value
        # write_attribute(:archived, value)
        # write_attribute(:archived, true) if value
        # super(value)
      # end
      #
      # define_method(:published=) do |val|
      #   raise ArgumentError, 'Do not set :published directly. Use the :publish, :archive: and :draft methods to change these values'
      # end
      #
      # define_method(:archived=) do |val|
      #   raise ArgumentError, 'Do not set :archived directly. Use the :publish, :archive: and :draft methods to change these values'
      # end

      define_method(:publish) do
        write_attribute(:published, true)
        write_attribute(:archived, false)
      end

      define_method(:archive) do
        write_attribute(:published, false)
        write_attribute(:archived, true)
      end

      define_method(:draft) do
        write_attribute(:published, false)
        write_attribute(:archived, false)
      end

      define_method(:commit=) do |val|
        unless [:publish, :draft, :archive].include?(val)
          raise ArgumentError, "#commit only accepts :publish, :draft, :archive, of which #{val} is none"
        end

        self.send(val)
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
end