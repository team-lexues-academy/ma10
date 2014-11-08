class PjaxController < ApplicationController
  layout 'pjax'

  def index
    render layout: false if request.headers['X-PJAX']
  end
end
