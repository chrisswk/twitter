require 'bcrypt'

class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true 
  validates :handle, uniqueness: true, presence: true
  validates :password_hash, presence: true 
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "Incorrectly formatted" }


  # def email_validator
  #   self.email.match ..... to test that the format of the email is valid
  # end


  has_many :tweets

  # people you are following
  # has_many :followingships, foreign_key: :user_followed_id, :class_name => "Followship"
  # has_many :followings, through: :followingships, source: :following
  
  # #people following you
  # has_many :followerships, foreign_key: :user_following_id, :class_name => "Followship"
  # has_many :followers, through: :followerships, source: :follower


  ######Think of 15-27 as one block
  # people the user follows
  has_many :followingships, 
    foreign_key: "user_followed_id", 

    class_name: "Followship"

  # THIS IS THE ACTUAL LOOK AT FOLLOWINGS 
  has_many :followings, 
    through: :followingships, 
    source: :following
    
  #####################################
  #Think of 29-38 as another block, establishing  
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

  def login
    @user = User.find_by_email(param[:email])
    if @user.password == params[:password]
      give_token
    else
      redirect_to '/'
    end
  end
end

