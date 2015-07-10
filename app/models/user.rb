require 'bcrypt'

class User < ActiveRecord::Base
  has_many :tweets

  # people you are following
  # has_many :followingships, foreign_key: :user_followed_id, :class_name => "Followship"
  # has_many :followings, through: :followingships, source: :following
  
  # #people following you
  # has_many :followerships, foreign_key: :user_following_id, :class_name => "Followship"
  # has_many :followers, through: :followerships, source: :follower

  # people the user follows
  has_many :followingships, 
    foreign_key: "user_followed_id", 

    class_name: "Followship"

  # THIS IS THE ACTUAL LOOK AT FOLLOWINGS 
  has_many :followings, 
    through: :followingships, 
    source: :following
    

  # people the user is being followed by
  has_many :followerships, 
    foreign_key: "user_following_id", 

    class_name: "Followship"

  # THIS IS THE ACTUAL LOOK AT FOLLOWERS  
  has_many :followers, 
    through: :followerships, 
    source: :follower

  # def hello
  #   p "Hi!"
  # end

  # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end