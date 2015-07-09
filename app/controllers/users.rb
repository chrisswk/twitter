get '/:id' do
	@tweets = Tweet.all
	@user = User.find_by(id: params[:id])
	erb :"users/index"	
end
######################## Andrew and Charlotte

post '/tweets/new' do
	@user = current_user
  @tweets = Tweet.all
  Tweet.create(text: params[:text], user_id: current_user.id)

  erb :"users/index"
end
######################## Andrew and Charlotte
