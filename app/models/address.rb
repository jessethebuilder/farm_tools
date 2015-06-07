class Address < ActiveRecord::Base
  belongs_to :has_address, :polymorphic => true

  STATE_HASH = {"AL"=>"Alabama", "AK"=>"Alaska", "AZ"=>"Arizona", "AR"=>"Arkansas", "CA"=>"California", "CO"=>"Colorado", "CT"=>"Connecticut", "DC"=>"Washington DC", "DE"=>"Delaware", "FL"=>"Florida", "GA"=>"Georgia", "HI"=>"Hawaii", "ID"=>"Idaho", "IL"=>"Illinois", "IN"=>"Indiana", "IA"=>"Iowa", "KS"=>"Kansas", "KY"=>"Kentucky", "LA"=>"Louisiana", "ME"=>"Maine", "MD"=>"Maryland", "MA"=>"Massachusetts", "MI"=>"Michigan", "MN"=>"Minnesota", "MS"=>"Mississippi", "MO"=>"Missouri", "MT"=>"Montana", "NE"=>"Nebraska", "NV"=>"Nevada", "NH"=>"New Hampshire", "NJ"=>"New Jersey", "NM"=>"New Mexico", "NY"=>"New York", "NC"=>"North Carolina", "ND"=>"North Dakota", "OH"=>"Ohio", "OK"=>"Oklahoma", "OR"=>"Oregon", "PA"=>"Pennsylvania", "RI"=>"Rhode Island", "SC"=>"South Carolina", "SD"=>"South Dakota", "TN"=>"Tennessee", "TX"=>"Texas", "UT"=>"Utah", "VT"=>"Vermont", "VA"=>"Virginia", "WA"=>"Washington", "WV"=>"West Virginia", "WI"=>"Wisconsin", "WY"=>"Wyoming"}

  geocoded_by :to_s

  reverse_geocoded_by :latitude, :longitude do |address, results|
    parse_reverse_geocode_results(address, results)
  end

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

  def google_embedded_map_url(api_key, prefix: nil, maptype:'roadmap', zoom: 16)
    url = "https://www.google.com/maps/embed/v1/place?key="
    url += api_key
    url += "&maptype=#{maptype}&zoom=#{zoom}&q="
    url += "#{prefix},+" if prefix
    url += self.to_s.parameterize
    url
  end

  def google_embedded_directions_from_my_location_url(api_key, prefix: nil)
    url = "https://www.google.com/maps/embed/v1/directions?key="
    url += api_key
    url += "&origin=my+location&destination="
    url += "#{prefix},+" if prefix
    url += self.to_s.parameterize
    url
  end

  def self.geocode_zip(zip)
    a = new zip: zip
    a.geocode
    [a.latitude, a.longitude]
  end

  private

  def self.parse_reverse_geocode_results(address, results)
    if geo = results.first
      address.city = geo.city
      address.state = geo.state
      address.zip = geo.postal_code
    end

    address
  end
end