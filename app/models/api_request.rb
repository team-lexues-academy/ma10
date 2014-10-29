class ApiRequest
  require 'net/http'
  require 'uri'
  require 'json'
  require 'date'

  def request(search_word)
    key = ENV["ASAHI_KENSAKU_API"]
    format = "wt=json"
    url = URI.parse("http://54.92.123.84/search?q=#{search_word}&#{format}&ackey=#{key}")
    json = Net::HTTP.get(url)
    JSON.parse(json)
  end
end
