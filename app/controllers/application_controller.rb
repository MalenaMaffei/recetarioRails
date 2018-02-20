
class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  # before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout, :show_shareable]
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


#
#   def helper_user_signed_in?
#     helpers.user_signed_in?
#   end
#
#   def helper_current_user
#     helpers.current_user
#   end
# alias_method :current_user, :helper_current_user
#   def helper_user_session
#     helpers.user_session
#   end







  # ADMIN = 'male'

  def valid_record?(record, message, ok_path, nok_layout)
   if record.valid?
     flash_redirect(message, ok_path)
   else
     render(nok_layout)
   end
  end

  def flash_redirect(message, path)
    flash[:notice] = message
    redirect_to(path)
  end

  def current_user
      User.find(session[:user_id]) if session[:user_id]
  end

  # def allowed?(owner)
  #   if owner == current_user || current_user.admin?
  #     true
  #   else
  #     false
  #   end
  # end


  protected

  def configure_permitted_parameters
      update_attrs = [:password, :password_confirmation, :current_password]
      devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end


  private
  def confirm_logged_in
    unless session[:user_id]
      flash_redirect("Please log in.", login_path)
    end
  end


end
