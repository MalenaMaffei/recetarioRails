# class AccessController < ApplicationController
# class AccessController < Devise::RegistrationsController
#     layout 'access'
    # def login
    #     #login form
    # end

    # def attempt_login
    #   if params[:username].present? && params[:password].present?
    #     found_user = User.where(:username => params[:username]).first
    #     if found_user
    #       authorized_user = found_user.authenticate(params[:password])
    #     end
    #   end
    #
    #   if authorized_user
    #     session[:user_id] = authorized_user.id
    #     flash[:notice] = "Bienvenid@ #{found_user.username}."
    #     redirect_to(root_path)
    #   else
    #     flash.now[:alert] = "Usuario o contraseña incorrectos."
    #     render('login')
    #   end
    # end
    #
    # def logout
    #   session[:user_id] = nil
    #   flash[:notice] = 'Vuelva Prontos!'
    #   redirect_to(login_path)
    # end
# end
