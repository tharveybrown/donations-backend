
class AuthController < ApplicationController
  skip_before_action :require_login, only: [:login, :auto_login]
  def login
    # byebug
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        payload = {user_id: user.id}
        token = encode_token(payload)
        render json: {user: user, jwt: token, success: "Welcome back, #{user.email}"}
    else
      render json: { 
        status: 401,
        errors: ['no such user', 'verify credentials and try again or signup']
      }
    end
  end

  def auto_login
    if session_user
      render json: session_user
    else
      render json: {
        logged_in: false,
        message: 'no such user'
      }
    end
  end

  

  def user_is_authed
    render json: {message: "You are authorized"}
  end
end