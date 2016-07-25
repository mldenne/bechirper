class FollowingsController < ApplicationController
  before_action :require_user
  before_action :load_user

  def create
    current_user.toggle_follow!(@user)
    
    render json: @user.reload
  end


  def load_user
    if params[:id] && @user = User.find(params[:id])
      @user
    else
      render json: {error: "User not found or params[:id] missing"}, status: :unprocessable_entity
    end
  end

end
