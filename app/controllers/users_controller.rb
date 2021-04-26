class UsersController < ApplicationController
  
  def create
    # Read in users params
    # Create a new user with them
    user = User.create(
      name: params[:name],
      username: params[:username]
      email: params[:email]
      password: params[:password]
    )

    # Send back the created user
    render json: user
  end
  
end
