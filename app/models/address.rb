class Address < ActiveRecord::Base
  belongs_to :has_address, :polymorphic => true

  geocoded_by :to_s
  reverse_geocoded_by :latitude, :longitude

  def to_s
    s = ''
    [:street, :street2, :street3, :city, :state, :zip].each do |sym|
      s += "#{send(sym)}, " if send(sym)
    end
    s.length > 2 ? s.chop.chop : s
  end

  def google_embedded_map(api_key, prefix: nil)
    html = '<iframe src="'
    html += google_embedded_map_url(api_key, prefix)
    html += '"'

    html.html_safe
  end

  # <iframe src="https://www.google.com/maps/embed/v1/place?key=AIzaSyBQmQELAdPqdohQD_hJUdpti6zbfTnVc2s&q=denver-relief"
  # width="100%" height="300px" frameborder="0" style="padding-left:3%; padding-right:3%;"></iframe>

  def google_embedded_map_url(api_key, prefix: nil)
    url = "https://www.google.com/maps/embed/v1/place?key="
    url += api_key
    url += "&q="
    url += "#{prefix},+" if prefix
    url += self.to_s.parameterize
    url
  end

  def Address.x
    self.new :street => '4218 Mt. Angeles Rd', :city => 'Port Angeles', :state => 'wa'
  end
end