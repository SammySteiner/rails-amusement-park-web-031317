class SessionsController < ApplicationController

  def new
  end

  def create
    if params[:user][:password].present? && params[:user][:name].present?
      @user = User.find_by(name: params[:user][:name])
      if @user.try(:authenticate, params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
    else
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to :root
  end

end
