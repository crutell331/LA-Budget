class Api::V1::AuthController < ApplicationController
  skip_before_action :authorize, only: [:login, :signup]

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def signup
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def logout
    session.delete(:user_id)
    render json: { message: 'Logged out successfully' }, status: :ok
  end

  def me
    if logged_in?
      render json: current_user, status: :ok
    else
      render json: { error: 'Not logged in' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:name, :username, :password)
  end
end
