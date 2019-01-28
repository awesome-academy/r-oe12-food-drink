module Admin
  class UsersController < AdminBaseController
    before_action :load_user, only: :destroy
    def index
      @users =
        if params[:search]
          User.search(params[:search]).order_by.page(params[:page]).
          per Settings.suggests.paginate.per_page
        else
          User.order_by.page(params[:page]).
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
