class PaymentsController < ApplicationController
  def create
    check = Check.find(params[:check_id])
    SendCheck.call(check)
    head :no_content
  rescue SendCheck::FailedSend => error
    render json: {error: error.message}, status: :unprocessable_entity
  end
end
