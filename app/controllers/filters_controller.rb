class FiltersController < ApplicationController
  def show
    @title = t ".all_product"
    @products = Product.filter_product(params).page(params[:page]).
      per Settings.paginate.per_page
  end
end
