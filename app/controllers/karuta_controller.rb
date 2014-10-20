class KarutaController < ApplicationController
  def index
    doc = DoraemonQuestion.new

    # 質問を取得
    @question = doc.question

    # 答えを取得
    @answer = doc.answer
    @answer_detail = doc.answer_detail
  end
end
