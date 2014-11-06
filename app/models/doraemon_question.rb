#しつもん！ドラえもん から問題と答えを取得する
class DoraemonQuestion
  def initialize
    @doc = get_doc + get_doc #get_docは１回で５問取得する
  end

  def doc
    doc = Hash.new({})
    (0..9).each{ |num|
      doc[num] = [get_question(num), get_answer(num)[1], get_answer(num)[2]]
    }
    doc
  end

  def get_question(quetion_num)
    question_request_num = quetion_num * 2 # 偶数
    question = @doc[question_request_num]["Body"]
    question.to_s.split('＊').first
  end

  def get_answer(answer_num)
    answer_request_num = answer_num * 2 + 1 # 奇数
    answer = @doc[answer_request_num]["Body"]
    answer.to_s.split('　') # 0 space ,1 answer ,2 answer_detail
  end

  private
  def get_doc
    doc = get_api_response["response"]["result"]["doc"]
  end

  def get_api_response
    begin
      response = ApiRequest.new().request(search_word('2013'))
      print response
    end while !doc_include?(response)
    return response
  end

  def doc_include?(response)
    if response.nil? or response["response"]["result"]["doc"].nil?
      return false
    end
    response["response"]["result"]["doc"][0]['Title'].include?('（しつもん！ドラえもん：')
  end

  def search_word(year)
    title = "Title:%E3%83%89%E3%83%A9%E3%81%88%E3%82%82%E3%82%93" #ドラえもん
    body = "Body:Fdujiko-Pro"
    release_date = "ReleaseDate:#{rand_date(year)}"
    space_and = "%20AND%20"
    sort = "sort=ReleaseDate"
    search_word = title + space_and + body + space_and + release_date + '&' + sort
  end

  def rand_date(year)
   day= rand(30) + 1
   return year + '-*-' + day.to_s
  end
end
