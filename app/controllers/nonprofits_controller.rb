class NonprofitsController < ApplicationController
  def update
    @nonprofit = Nonprofit.find_and_update(params[:id], nonprofit_params)
    if @nonprofit.valid?
      render :show, status: :ok
    else
      render json: @nonprofit.errors, status: :unprocessable_entity
    end
  end

  private

  def nonprofit_params
    params.require(:nonprofit).permit(:name, :address)
  end
end
