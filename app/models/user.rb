class User < ActiveRecord::Base
  # write associations here
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  # has a method 'mood' that returns 'sad' when the user is more nauseous than happy (FAILED - 7)
  # has a method 'mood' that returns 'happy' when the user is more happy than nauseous (FAILED - 8)
  def mood
    if nausea > happiness
      "sad"
    else
      "happy"
    end
  end
end
