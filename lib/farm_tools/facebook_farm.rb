# require 'koala'
#
# class FacebookFarm
#
#   def initialize(app_id, app_secret, access_style: :app)
#     @app_id = app_id
#     @app_secret = app_secret
#     @oauth = Koala::Facebook::OAuth.new(app_id, @app_secret)
#     set_access_token(access_style)
#   end
#
#   def the_app
#     get_object(@app_id)
#   end
#
#   def get_object(selector)
#     graph.get_object(selector)
#   end
#
#   def post_to_wall(post_content)
#     graph.put_wall_post(post_content)
#   end
#
#   def reset_access_style(access_style)
#     set_access_token(access_style)
#     @graph = nil
#   end
#
#   private
#
#   def set_access_token(access_style)
#     if access_style == :app
#        @access_token = @oauth.get_app_access_token
#     end
#     # @access_token = "1405477876366613|ak9Hi6Sfv1EJn4proUVt1NetwKQ"
#   end
#
#   def access_token
#     @access_token
#   end
#
#   def app_access_token
#     @oauth.get_app_access_token
#   end
#
#   def graph
#     @graph ||= Koala::Facebook::API.new(@access_token, @app_secret)
#   end
#
#
#
#
# public
#
#   def self.x
#     new('1405477876366613', '411d2788e5cd4d73765b276dfae33476')
#   end
# end