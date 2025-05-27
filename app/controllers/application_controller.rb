class ApplicationController < ActionController::API
  before_action :authorize
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    render json: { error: 'Not authorized' }, status: :unauthorized unless logged_in?
  end
end
