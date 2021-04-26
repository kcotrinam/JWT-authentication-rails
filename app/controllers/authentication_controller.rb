class AuthenticationController < ApplicationController

  def login
    user = User.find_by(username: params[:username])

    if (!user)
      render json: { message: 'Invalid username'}
    else
      if user.authenticate(params[:password])
        secret_key = Rails.application.secrets.secret_key_base[0]

        token = JWT.encode({
          user_id: user.id,
          username: user.name,
        }, secret_key)

        render json: { token: token } 
      else
        render json: { message: 'Invalid password'}
      end  
    end
  end

end

