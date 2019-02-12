module Admin
  class UsersController < AdminBaseController
    before_action :load_user, :admin_user, only: :destroy
    def index
      @search = User.search params[:q]
      @users =
        if params[:q]
          @search.result(distinct: true).order_created_at_desc.page(params[:page]).
          per Settings.suggests.paginate.per_page
        else
          User.order_created_at_desc.page(params[:page]).
          per Settings.suggests.paginate.per_page
        end
    end

    def destroy
      if @user.destroy
        flash[:success] = t ".delete_success"
      else
        flash[:danger] = t ".delete_failed"
      end
      redirect_to admin_users_path
    end

    private

    def load_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:danger] = t "error_sign_up"
      redirect_to admin_users_path
    end
  end
end
