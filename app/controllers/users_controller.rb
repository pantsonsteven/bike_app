class UsersController < ApplicationController

  # before_action :authorize, only: [:index] # huh??

  def index
    @user = current_user
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to root_path
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    redirect_to users_path
  end

  def show
    @user = User.find(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :email_confirmation, :password, :password_confirmation)
  end

end
