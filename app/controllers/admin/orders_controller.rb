module Admin
  class OrdersController < AdminBaseController
    before_action :find_order, only: :update

    def index
      @search = Order.search params[:q]
      @orders =
        if params[:q]
          @search.result(distinct: true).order_created_at_desc.page(params[:page]).
            per Settings.suggests.paginate.per_page
        else
          Order.order_created_at_desc.page(params[:page]).
            per Settings.paginate.per_page
        end
    end

    def update
      status = params[:status].to_i
      if @order.update_attribute(:status, status)
        flash[:success] = t ".update_success"
      else
        flash[:danger] = t ".update_failed"
      end
      redirect_to admin_orders_path
    end

    private

    def find_order
      @order = Order.find_by id: params[:id]
      return if @order
      flash[:danger] = t "admin.orders.not_found_order"
      redirect_to admin_orders_path
    end
  end
end
