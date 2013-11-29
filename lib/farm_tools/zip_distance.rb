module ZipDistance
  STATES = {'al' => 'Alabama', 'ak' => 'Alaska', 'az' => 'Arizona', 'ar' => 'Arkansas', 'ca' => 'California', 'co' => 'Colorado', 'ct' => 'Connecticut', 'dc' => 'District of Columbia', 'de' => 'Delaware', 'fl' => 'Florida', 'ga' => 'Georgia', 'hi' => 'Hawaii', 'id' => 'Idaho', 'il' => 'Illinois', 'in' => 'Indiana', 'ia' => 'Iowa', 'ks' => 'Kansas', 'ky' => 'Kentucky', 'la' => 'Louisiana', 'me' => 'Maine', 'md' => 'Maryland', 'ma' => 'Massachusetts', 'mi' => 'Michigan', 'mn' => 'Minnesota', 'ms' => 'Mississippi', 'mo' => 'Missouri', 'mt' => 'Montana', 'ne' => 'Nebraska', 'nv' => 'Nevada', 'nh' => 'New Hampshire', 'nj' => 'New Jersey', 'nm' => 'New Mexico', 'ny' => 'New York', 'nc' => 'North Carolina', 'nd' => 'North Dakota', 'oh' => 'Ohio', 'ok' => 'Oklahoma', 'or' => 'Oregon', 'pa' => 'Pennsylvania', 'ri' => 'Rhode Island', 'sc' => 'South Carolina', 'sd' => 'South Dakota', 'tn' => 'Tennessee', 'tx' => 'Texas', 'ut' => 'Utah', 'vt' => 'Vermont', 'va' => 'Virginia', 'wa' => 'Washington', 'wv' => 'West Virginia', 'wi' => 'Wisconsin', 'wy' => 'Wyoming'}

  #from http://zipcodedistanceapi.redline13.com/
  ZIP_CODE_API_KEY = 'NlqPug52897cplVS3EcFlNnx6F4HOjfCFFs9Wxb5Hji7FdZJScoe0ML7sPOh94TO'
  URL_PREFIX = "http://zipcodedistanceapi.redline13.com/rest/#{ZIP_CODE_API_KEY}"

  def zips_near(zip, radius, format = 'miles')
    h = zips_hash(zip, radius, format)
    zip_array = []
    if h
      h['zip_codes'].each do |hash|
        zip_array << hash['zip_code']
      end
    end
    zip_array
  end

  def random_zip_for(city, state)
    zips = zips_for(city, state)
    zips ? zips['zip_codes'].sample : nil
  end

  def random_zip_for!(city, state)
    zips = zips_for(city, state)
    zips ? zips['zip_codes'].sample : raise(ArgumentError, "#{city}, #{state} does not generate a zip code")
  end


  def zips_for(city, state)
    url = "#{URL_PREFIX}/city-zips.json/#{CGI.escape(city.to_s)}/#{state}"
    res = RestHelper.get(url)
    has_error(res) ? nil : JSON.parse(res)
  end

  private

  def zip_to_geocoded_hash(zip)
    url = "#{URL_PREFIX}/info.json/#{zip}/degrees"
    res = RestHelper.get(url)
    has_error(res) ? nil : JSON.parse(res)
  end

  def zips_hash(zip, radius, format = 'miles')
    url = "#{URL_PREFIX}/radius.json/#{zip}/#{radius}/#{format}"
    res = RestHelper.get(url)
    has_error(res) ? nil : JSON.parse(res)
  end

  def has_error(result)
    result['error_code'] ? true : false
  end
end