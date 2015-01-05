module RestHelper
  require 'net/http'


  def get_response_code(url)
    get_response(url).code
  end

  def get_response_body
    get_response(url).body
  end


  def get_response(url)
    Net::HTTP.get_response(URI.parse(url))
  end
end