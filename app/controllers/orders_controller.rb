class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i(create index destroy)
  before_action :load_order, :check_status, only: :destroy

  def index
    @orders = current_user.orders.page(params[:page]).
      per Settings.paginate.per_page
  end

  def create
    @order = current_user.orders.new
    session[:shopping_cart].each do |item|
      @order.order_details << @order.order_details.new(item)
    end
    if @order.save
      flash[:success] = t ".order_success"
      session[:shopping_cart] = []
    else
      flash[:danger] = t ".order_failed"
    end
    redirect_to orders_path
  end

  def destroy
    if @order.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_failed"
    end
    redirect_to orders_path
  end


  private

  def load_order
    @order = current_user.orders.find_by id: params[:id]
    return if @order
    flash[:danger] = t "orders.not_found_order"
    redirect_to orders_path
  end

  def check_status
    return if @order.pending?
    flash[:danger] = t "admin.suggests.can_not_delete"
    redirect_to admin_suggests_path
  end
end
