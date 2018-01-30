class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout, :show_shareable]

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

  private
  def confirm_logged_in
    unless session[:user_id]
      flash_redirect("Please log in.", login_path)
    end
  end


end
