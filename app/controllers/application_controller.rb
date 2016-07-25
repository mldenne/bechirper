class ApplicationController < ActionController::API

  private

  def current_user
    if params[:auth_token] && User.exists?(auth_token: params[:auth_token])
      @current_user = User.find_by(auth_token: params[:auth_token])
    end
    @current_user
  end

  def require_user
    unless current_user
      render json: {errors: "You need to be logged in"}, status: :forbidden
    end
  end

end
