get '/users/:id' do
	@tweets = Tweet.all
	@users = User.all
	@user = User.find_by(id: params[:id])
	erb :"users/index"	
end


post '/tweets/new' do
	@user = current_user
  @tweets = Tweet.all
  Tweet.create(text: params[:text], user_id: current_user.id)

  # erb :"users/index"
  redirect "/users/#{@user.id}"
end

post '/users/follow' do
	@user = User.find_by(id: params[:user_id])
	current_user.followings << @user
	redirect "/users/#{@user.id}"
end

post '/users/unfollow' do
	@user = User.find_by(id: params[:user_id])
	current_user.followings.delete(@user)
	redirect "/users/#{@user.id}"
end

