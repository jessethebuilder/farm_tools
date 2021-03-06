#the publish_or_archive record needs to be added to the beginning of :create and :update
#set_[instance_variable] needs to be modified to make a new object if params[:id] is not found.

#Follow directions at the top of each module.

module SaveDraftArchiveDelete
  #extend in model

  def self.extended(klass)
    klass.instance_eval do

      define_method(:publish) do
        if errors.blank?
          update_attribute(:published, true)
          update_attribute(:archived, false)
        end
      end

      define_method(:archive) do
        if errors.blank?
          update_attribute(:published, false)
          update_attribute(:archived, true)
        end
      end

      define_method(:draft) do
        if errors.blank?
          update_attribute(:published, false)
          update_attribute(:archived, false)
        end
      end

      define_method(:commit=) do |val|
        unless [:publish, :draft, :archive].include?(val)
          raise ArgumentError, "#commit only accepts :publish, :draft, :archive, of which #{val} is none"
        end
        # @commit
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


# module SaveDraftArchiveDeleteControllerHelper
#   def publish?
#     params[:commit] == 'Publish'
#   end
#
#   def archive?
#     params[:commit] == 'Archive'
#   end
#
#   def publish_or_archive(record)
#     record.write_attribute(:published, publish?)
#     record.write_attribute(:archived, archive?)
#   end
# end