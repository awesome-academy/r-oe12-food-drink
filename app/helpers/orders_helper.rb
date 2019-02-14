module OrdersHelper
  def select_status
    Order.statuses.map{|key, value| [key,value]}
  end
end
