class ApiRequest
  require 'net/http'
  require 'uri'
  require 'json'

  def response
    key = ENV["ASAHI_KENSAKU_API"]
    title = "Title:%E3%83%89%E3%83%A9%E3%81%88%E3%82%82%E3%82%93" #ドラえもん
    release_date = "ReleaseDate:2010-01-10"
    url = "http://54.92.123.84/search?q=#{title}%20AND%20#{release_date}&ackey=#{key}"
    REXML::Document.new(open(url))
  end
end
