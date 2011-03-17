class Forem::ApplicationController < ApplicationController
  def authenticate_forem_user
    unless user_signed_in?
      session[:return_to] = request.fullpath
      flash[:error] = t("forem.errors.not_signed_in")
      redirect_to new_user_session_path
    end
  end
#
  def authenticate_forem_admin
  unless refinery_user?     #    current_user && current_user.has_role?(:refinery) # all
      flash[:error] = t("forem.errors.access_denied")
      redirect_to forums_path
    end
  end
#
#  # dummy method
#  def current_user
#  end
end