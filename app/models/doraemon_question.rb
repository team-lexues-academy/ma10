#しつもん！ドラえもん から問題と答えを取得する
class DoraemonQuestion
  def question
    api_response["response"]["result"]["doc"][0]["Body"]
  end

  def answer
    get_answer[1]
  end

  def answer_detail
    get_answer[2]
  end

  private
  def api_response
    ApiRequest.new().response
  end

  def get_answer
    body = api_response["response"]["result"]["doc"][1]["Body"]
    body_splited = body.to_s.split('　')
  end
end
