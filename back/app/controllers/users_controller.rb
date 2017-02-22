class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    @user = User.find_by_email(params[:email])
    if @user.password == Base64.decode64(params[:password])
      render json: {email: @user.email, first_name: @user.first_name, last_name: @user.last_name, id: @user.id}, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    if @user.save!
      render json: {email: @user.email, first_name: @user.first_name, last_name: @user.last_name, id: @user.id}, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by_email(user_params[:email])
    if @user.password == params[:password]
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
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params[:password] = Base64.decode64(params[:password])
      params.require(:user).permit(:first_name, :last_name, :password, :email)
    end
end
