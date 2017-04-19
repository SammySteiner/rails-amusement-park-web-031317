class RidesController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:ride_id])
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    flash[:message] = @ride.take_ride
    redirect_to user_path(@user)
  end

end
