class ApplicationController < ActionController::API
  before_action :require_login

  def encode_token(payload)
      JWT.encode(payload, 'my_secret')
  end

  def auth_header
      request.headers['Authorization']
  end

  def decoded_token
      if auth_header
          token = auth_header.split(' ')[1]
          begin
              JWT.decode(token, 'my_secret', true, algorithm: 'HS256')
          rescue JWT::DecodeError
              []
          end
      end
  end

  def session_user
      decoded_hash = decoded_token
      if !decoded_hash.empty? 
          puts decoded_hash.class
          user_id = decoded_hash[0]['user_id']
          @user = User.find_by(id: user_id)
      else
          nil 
      end
  end

  def logged_in?
      !!session_user
  end

  def require_login
   render json: {message: 'Please Login'}, status: :unauthorized unless logged_in?
  end
end
