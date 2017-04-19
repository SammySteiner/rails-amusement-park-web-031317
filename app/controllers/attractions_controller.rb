class AttractionsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
  end

  def new
    @user = User.find(session[:user_id])
  end

  def create
    @attraction = Attraction.new(params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height))
    @attraction.save
    redirect_to attraction_path(@attraction.id)
  end

  def edit
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
    @attraction.update(params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height))
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

end
