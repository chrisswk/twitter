class Followship < ActiveRecord::Base

	belongs_to :following, foreign_key: "user_following_id", class_name: "User" 

	# CHANGED: follower: ----> followed:
	belongs_to :follower, foreign_key: "user_followed_id", class_name: "User"

  # Remember to create a migration!
end
