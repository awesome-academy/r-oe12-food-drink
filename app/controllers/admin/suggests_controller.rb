module Admin
  class SuggestsController < AdminBaseController
    before_action :load_suggest, only: %i(destroy update)
    before_action :check_status, only: :destroy

    def index
      @suggests =
        if params[:search]
          Suggest.search(params[:search]).order_by.page(params[:page]).
          per Settings.suggests.paginate.per_page
        else
          Suggest.order_by.page(params[:page]).
          per Settings.suggests.paginate.per_page
        end
    end

    def destroy
      if @suggest.destroy
        flash[:success] = t ".delete_success"
      else
        flash[:danger] = t ".delete_failed"
      end
      redirect_to admin_suggests_path
    end

    def update
      status = params[:status].to_i
      if @suggest.update_attribute(:status, status)
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".failed"
      end
      redirect_to admin_suggests_path
    end

    private

    def check_status
      return unless @suggest.accept?
      flash[:danger] = t "admin.suggests.can_not_delete"
      redirect_to admin_suggests_path
    end

    def load_suggest
      @suggest = Suggest.find_by id: params[:id]
      return if @suggest
      flash[:danger] = t "error_sign_up"
      redirect_to admin_suggests_path
    end
  end
end
