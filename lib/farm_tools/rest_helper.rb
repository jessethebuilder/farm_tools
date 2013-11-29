module RestHelper
  require 'net/http'

  def self.get(url)
    #untested
    resp = Net::HTTP.get_response(URI.parse(url))
    resp.body
  end
end