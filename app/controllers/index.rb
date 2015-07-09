get '/' do  
	@tweets = Tweet.all
	@user = User.find_by(id: 1)
	erb :"users/index"	
end
