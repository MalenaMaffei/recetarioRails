class UsersController < ApplicationController
  def index
      @users = User.all
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

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
