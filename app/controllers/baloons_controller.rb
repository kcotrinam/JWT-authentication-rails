class BaloonsController < ApplicationController
  def index
    baloons = Baloon.all
    byebug
    render json: { ballons: baloons }
  end

  def create
    authorization_header = request.headers[:Authorization]
    if !authorization_header
      render status: :unauthorized
    else
      token = authorization_header.split(' ')[1]
      secret_key = Rails.application.secrets.secret_key_base[0]
      decoded_token = JWT.decode(token, secret_key)

      user = User.find(decoded_token[0]["user_id"])

      baloon = Baloon.create(
        name: params[:name],
        quantity: params[:quantity]
      )

      render json: { baloon: baloon }
    end
  end
end
