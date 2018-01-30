class UsersController < ApplicationController
  before_action :confirm_permissions, :except => [:show]
  def index
      @users = User.all
  end

  def show
      @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    valid_record?(@user, "Usuario '#{@user.username}' creado exitosamente.", users_path, 'new')
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    valid_record?(@user, "Usuario '#{@user.username}' actualizado exitosamente.", users_path, 'edit')
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash_redirect("Usuario '#{@user.username}' eliminado.", users_path)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def confirm_permissions
      # user = User.find(params[:id])
      unless current_user.admin?
        flash_redirect("No tenes permisos para realizar esa accion.", root_path)
      end
    end
end
