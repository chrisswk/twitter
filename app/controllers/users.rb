get '/:id' do
	@tweets = Tweet.all
	@user = User.find_by(id: params[:id])
	erb :"users/index"	
end
######################## Andrew and Charlotte

post '/tweets/new' do
  Tweet.create(text: params[:text])
  erb :"users/index"
end
######################## Andrew and Charlotte
