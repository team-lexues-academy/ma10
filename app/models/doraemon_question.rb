#しつもん！ドラえもん から問題と答えを取得する
class DoraemonQuestion
  def question
    api_response.elements['response/result/doc/Body']
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
    body = api_response.elements['response/result/doc[2]/Body']
    body_splited = body.to_s.split('　')
  end
end
