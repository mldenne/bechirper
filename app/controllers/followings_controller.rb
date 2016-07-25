class FollowingsController < ApplicationController
  before_action :require_user
  before_action :load_user

  def create
    current_user.follow!(@user)
    UserNotifierMailer.user_being_followed_email(@user, current_user).deliver_later
    render json: @user.reload, serializer: UserCondensedSerializer, scope: current_user, scope_name: :current_user
  end

  def destroy
    current_user.unfollow!(@user)
    render json: @user.reload, serializer: UserCondensedSerializer, scope: current_user, scope_name: :current_user
  end


  def load_user
    if params[:id] && @user = User.find(params[:id])
      @user
    else
      render json: {error: "User not found or params[:id] missing"}, status: :unprocessable_entity
    end
  end

end
