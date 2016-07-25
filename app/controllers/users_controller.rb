class UsersController < ApplicationController
  before_action :require_user, only: [:show, :index]

  # GET /users
  def index
    @users = User.all.where.not(id: current_user.id)

    render json: @users, each_serializer: UserCondensedSerializer, scope: current_user, scope_name: :current_user
  end

  # GET /users/1
  def login
    @user = User.find_by(username: params[:username])
    if @user
      if @user.authenticate(params[:password])
        render json: @user
      else
        render json: {errors: "Incorrect password"}, :status => 419
      end
    else
      render json: {errors: "User not found"}, :status => 421
    end
  end

  def show
    if params[:id] == 'me'
      @user = current_user
      render json: @user
    else
      @user = User.find(params[:id])
      render json: @user
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      UserNotifierMailer.send_signup_email(@user).deliver
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.permit(:name, :username, :email, :bio_image, :bio, :password)
    end
end
