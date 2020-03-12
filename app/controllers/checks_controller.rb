class ChecksController < ApplicationController
  def index
    @checks = Check.unsent.includes(:nonprofit).page(params[:page]).per(20)
  end
end
