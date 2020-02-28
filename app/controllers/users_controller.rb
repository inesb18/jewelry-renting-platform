class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize(@user)
  end

  def edit
    @user = current_user
    authorize(@user)
  end

  def update
    user = current_user
    user.update(user_params)
    authorize(user)
    redirect_to edit_user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :address, :email, :photo)
  end
end
