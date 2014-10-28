class ApiRequest
  require 'net/http'
  require 'uri'
  require 'json'
  require 'date'

  def rand_date(d_from,d_to)
    from = Date.parse(d_from)
    to = Date.parse(d_to)
    days = to - from + 1
    return from + rand(days)
  end

  def response
    key = ENV["ASAHI_KENSAKU_API"]
    title = "Title:%E3%83%89%E3%83%A9%E3%81%88%E3%82%82%E3%82%93" #ドラえもん
    begin
      release_date = "ReleaseDate:#{rand_date("2010-10-06","2011-10-10")}"
      format = "wt=json"
      body = "Body:Fdujiko-Pro"
      url = URI.parse("http://54.92.123.84/search?q=#{title}%20AND%20#{body}%20AND%20#{release_date}&#{format}&ackey=#{key}")
      json = Net::HTTP.get(url)
      result = JSON.parse(json)
    end while result["response"]["result"]["doc"].nil?
    return result
  end
end
