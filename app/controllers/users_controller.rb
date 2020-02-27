class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to users_edit_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :address, :email, :photo)
  end
end
