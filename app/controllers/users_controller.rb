class UsersController < ApplicationController

  before_action :authorize, only: [:edit, :update, :show] # huh??

  def index
    
    @user = current_user
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to log_in_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :email_confirmation, :password, :password_confirmation)
  end

end
