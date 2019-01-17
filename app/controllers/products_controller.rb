class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]
    return if @product
    redirect_to root_url
    flash[:danger] = t ".notfound"
  end
end
