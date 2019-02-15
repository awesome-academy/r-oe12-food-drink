class SuggestsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :load_suggest, only: %i(destroy edit update)

  def index
    @suggests = Suggest.order_created_at_desc.page(params[:page]).
      per Settings.suggests.paginate.per_page
  end

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

  def edit; end

  def update
    if @suggest.update suggest_params
      flash[:success] = t ".success"
      redirect_to suggests_path
    else
      flash[:danger] = t ".failed"
      render :edit
    end
  end

  def destroy
    if @suggest.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_failed"
    end
    redirect_to suggests_path
  end

  private

  def suggest_params
    params.require(:suggest).permit :name, :describe, :picture, :price
  end

  def load_suggest
    @suggest = Suggest.find_by id: params[:id]
    return if @suggest
    flash[:danger] = t "error_sign_up"
    redirect_to suggests_path
  end
end
