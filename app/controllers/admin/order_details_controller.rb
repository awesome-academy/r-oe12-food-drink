module Admin
  class OrderDetailsController < AdminBaseController
    before_action :load_order, only: :index

    def index
      @order_details = @order.order_details.page(params[:page]).
        per Settings.paginate.per_page
    end

    private

    def load_order
      @order = Order.find_by id: params[:order_id]
      return if @order
      flash[:danger] = t "admin.orders.not_found_order"
      redirect_to admin_orders_path
    end
  end
end
