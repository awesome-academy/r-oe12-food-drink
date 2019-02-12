module Admin
  class ProductsController < AdminBaseController
    before_action :load_product, only: %i(destroy edit update)
    before_action :check_order, only: :destroy

    def index
      @search = Product.search params[:q]
      @products =
        if params[:q]
          @search.result(distinct: true).order_created_at_desc.page(params[:page]).
          per Settings.suggests.paginate.per_page
        else
          Product.order_created_at_desc.page(params[:page]).
            per Settings.product.paginate.per_page
        end
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new product_params

      if @product.save
        flash[:success] = t ".success"
        redirect_to admin_products_path
      else
        flash[:danger] = t ".failed"
        render :new
      end
    end

    def edit; end

    def update
      if @product.update product_params
        flash[:success] = t ".success"
        redirect_to admin_products_path
      else
        flash[:danger] = t ".failed"
        render :edit
      end
    end

    def destroy
      if @product.destroy
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".failed"
      end
      redirect_to admin_products_path
    end

    private

    def product_params
      params.require(:product).permit :name, :describe, :quantity,
        :picture, :price, :price_new, :category_id
    end

    def load_product
      @product = Product.find_by id: params[:id]

      return if @product
      flash[:danger] = t "admin.products.not_found_product"
      redirect_to admin_products_path
    end

    def check_order
      return unless @product.order_details.present?
      flash[:danger] = t "admin.products.can_not_delete"
      redirect_to admin_products_path
    end
  end
end
