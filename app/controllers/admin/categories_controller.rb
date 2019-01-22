module Admin
  class CategoriesController < AdminBaseController
    before_action :load_category, only: %i(destroy edit update)
    before_action :check_product, only: :destroy

    def index
      @categories = Category.page(params[:page]).
        per Settings.paginate.per_page
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new category_params
      if @category.save
        flash[:success] = t ".success"
        redirect_to admin_categories_path
      else
        flash[:danger] = t ".failed"
        render :new
      end
    end

    def edit; end

    def update
      if @category.update category_params
        flash[:success] = t ".success"
        redirect_to admin_categories_path
      else
        flash[:danger] = t ".failed"
        render :edit
      end
    end

    def destroy
      if @category.destroy
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".failed"
      end
      redirect_to admin_categories_path
    end

    private

    def category_params
      params.require(:category).permit :name
    end

    def load_category
      @category = Category.find_by id: params[:id]
      return if @category
      flash[:danger] = t ".not_found"
      redirect_to admin_categories_path
    end

    def check_product
      return unless @category.products.present?
      flash[:danger] = t "admin.categories.can_not_delete"
      redirect_to admin_categories_path
    end
  end
end
