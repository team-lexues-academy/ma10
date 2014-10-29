#しつもん！ドラえもん から問題と答えを取得する
class DoraemonQuestion
  def question
    get_api_response["response"]["result"]["doc"][0]["Body"]
  end

  def answer
    get_answer[1]
  end

  def answer_detail
    get_answer[2]
  end

  private
  def get_api_response
    title = "Title:%E3%83%89%E3%83%A9%E3%81%88%E3%82%82%E3%82%93" #ドラえもん
    body = "Body:Fdujiko-Pro"
    space_and = "%20AND%20"
    begin
      release_date = "ReleaseDate:#{rand_date("2010-10-06","2011-10-10")}"
      search_word = title + space_and + body + space_and + release_date
      result = ApiRequest.new().request(search_word)
    end while result["response"]["result"]["doc"].nil?
    return result
  end

  def rand_date(d_from,d_to)
    from = Date.parse(d_from)
    to = Date.parse(d_to)
    days = to - from + 1
    return from + rand(days)
  end

  def get_answer
    body = get_api_response["response"]["result"]["doc"][1]["Body"]
    body_splited = body.to_s.split('　')
  end
end
