class KarutaController < ApplicationController
  def index
  end

  def doraemon
    doraemon = DoraemonQuestion.new
    doc = doraemon.doc
    #binding.pry
    respond_to do |format|
      format.html { render nothing: true }
      format.json { render json: doc.to_json }
    end
  end

  def level1
    index
  end

  def level2
    index
  end

  def level3
    index
  end

  def level4
    index
  end

  def karuta
    index
  end
end
