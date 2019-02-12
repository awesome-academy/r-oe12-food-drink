class StaticPagesController < ApplicationController
  def home
    @food_product = Product.order_created_at_desc.category_by(Settings.category.food).
      page(params[:page]).per Settings.paginate.per_page
    @drink_product = Product.order_created_at_desc.category_by(Settings.category.drink).
      page(params[:page]).per Settings.paginate.per_page
  end
end
