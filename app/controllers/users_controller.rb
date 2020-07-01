class UsersController < ApplicationController
  def create
    User.create(user_params)
  end
 
  private
 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
