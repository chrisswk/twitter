get '/:id' do
	@tweets = Tweet.all
	@user = User.find_by(id: params[:id])
	erb :"users/index"	
end