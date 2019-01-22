module Admin
  class AdminBaseController < ApplicationController
    before_action :user_signed_in?, :admin_user
    layout "application_admin"
  end
end
