class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

 # has a method 'take_ride' that accounts for the user not having enough tickets (FAILED - 1)
 # has a method 'take_ride' that accounts for the user not being tall enough (FAILED - 2)
 # has a method 'take_ride' that accounts for the user not being tall enough and not having enough tickets (FAILED - 3)
 # has a method 'take_ride' that updates ticket number (FAILED - 4)
 # has a method 'take_ride' that updates the user's nausea (FAILED - 5)
 # has a method 'take_ride' that updates the user's happiness (FAILED - 6)

 def take_ride
   find_user
   find_attraction
   if not_tall_enough? && not_enough_tickets?
     "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
   elsif !not_tall_enough? && not_enough_tickets?
     not_enough_tickets?
   elsif !not_enough_tickets? && not_tall_enough?
     not_tall_enough?
   else #takes the ride
    take_tickets
    nauseate
    make_happy
    @user.save
  end

 end

 def not_enough_tickets?
  if @attraction.tickets > @user.tickets
    "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
  end
 end

 def not_tall_enough?
   if @attraction.min_height > @user.height
     "Sorry. You are not tall enough to ride the #{@attraction.name}."
   end
 end

 def take_tickets
   @user.tickets -= @attraction.tickets
 end

 def nauseate
   @user.nausea += @attraction.nausea_rating
 end

 def make_happy
   @user.happiness += @attraction.happiness_rating
 end

 def find_user
   @user = User.find(self.user_id)
 end

 def find_attraction
   @attraction = Attraction.find(self.attraction_id)
 end

end
