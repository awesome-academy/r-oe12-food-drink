class OrderDetailsController < ApplicationController
  before_action :authenticate_user!, :load_order, only: %i(index)

  def index
    @order_details = @order.order_details.page(params[:page]).
      per Settings.paginate.per_page
  end

  private

  def load_order
    @order = current_user.orders.find_by id: params[:order_id]
    return if @order
    flash[:danger] = t ".not_found_order"
    redirect_to orders_path
  end
end
