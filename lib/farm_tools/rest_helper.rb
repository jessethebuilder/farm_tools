module RestHelper
  require 'net/http'

  def self.get(url)
    Net::HTTP.get_response(URI.parse(url))
  end

  def self.get_response_code(url)
    get(url).code
  end

  def self.get_response_body
    get(url).body
  end
end