#module BetterUrl
#  def use_better_urls
#    class_eval do
#      before_save :update_for_url
#      validates :for_url, :uniqueness => true
#    end
#
#    def update_for_url(record)
#      record.for_url = record.name.parameterize unless record.for_url == record.name.parameterize
#    end
#  end
#end