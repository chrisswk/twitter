class CreateFollowships < ActiveRecord::Migration
  def change
  	create_table :followships do |t|
  		t.integer	:user_followed_id
  		t.integer :user_following_id 
  	end
  end
end
