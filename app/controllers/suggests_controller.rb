class SuggestsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def new
    @suggest = Suggest.new
  end

  def create
    @suggest = current_user.suggests.build suggest_params
    if @suggest.save
      flash[:success] = t ".suggest_success"
      redirect_to root_url
    else
      flash[:danger] = t ".suggest_fail"
      render :new
    end
  end

  private

  def suggest_params
    params.require(:suggest).permit :name, :describe, :picture, :price
  end
end
