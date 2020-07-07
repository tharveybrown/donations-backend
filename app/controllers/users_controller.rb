class UsersController < ApplicationController
  skip_before_action :require_login, only: [:create]

  # def index
  #     @users = User.all
  #     if @users
  #       render json: {
  #         users: @users
  #       }
  #     else
  #       render json: {
  #         status: 500,
  #         errors: ['no users found']
  #       }
  #     end
  # end
  def create
    user = User.create(user_params) 
    if user.valid?
        payload = {user_id: user.id}
        token = encode_token(payload)
        debugger
        puts token
        render json: {user: user, jwt: token}
    else
        render json: {errors: user.errors.full_messages}, status: :not_acceptable
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: {
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: ['user not found']
      }
    end
  end


    
  private
    
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end