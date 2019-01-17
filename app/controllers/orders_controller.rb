class OrdersController < ApplicationController
  before_action :user_signed_in?, only: %i(index)

  def index
    @orders = current_user.orders.page(params[:page]).
      per Settings.paginate.per_page
  end
end
