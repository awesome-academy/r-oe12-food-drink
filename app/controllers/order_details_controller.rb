class OrderDetailsController < ApplicationController
  before_action :user_signed_in?, :find_order, only: %i(show)

  def show
    @order_details = @order.order_details.page(params[:page]).
      per Settings.paginate.per_page
  end

  private

  def find_order
    @order = current_user.orders.find_by id: params[:id]
    return if @order
    flash[:danger] = t ".not_found_order"
    redirect_to orders_path
  end
end
