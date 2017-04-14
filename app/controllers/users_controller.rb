class UsersController < ApplicationController

  def index

  end

  def show
    if session[:user_id]
      set_user
    else
      redirect_to :root
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signup_path
    end
  end

  def update

  end

  def edit

  end

  def destroy

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :height, :nausea, :tickets, :happiness, :admin)
  end

  def passwords_match?
    params[:user][:password] == params[:user][:password_confirmation]
  end
end
