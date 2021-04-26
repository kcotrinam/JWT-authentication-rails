class BaloonsController < ApplicationController
  before_action :authenticate, only: [:create]

  def index
    baloons = Baloon.all
    render json: { ballons: baloons }
  end

  def create
    baloon = Baloon.create(
      name: params[:name],
      quantity: params[:quantity],
      user: @user
    )

    render json: { baloon: baloon }
  end
end
