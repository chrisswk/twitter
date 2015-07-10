# get '/' do  
# 	@tweets = Tweet.all
# 	@user = User.find_by(id: 1)
# 	erb :"users/index"	
# end

get '/' do

	erb :index
end


get '/logout' do
	session[:user_id] = nil
	redirect '/'
end
#after a user signs in, it redirects to the user profile
post '/signup' do
	@tweets = Tweet.all
	@user = User.create(handle: params[:handle], email: params[:email], password_hash: params[:password_hash])
	session[:user_id] = @user.id
	redirect "/users/#{@user.id}"
	#should be users/:id
end

post '/login' do
	@user = User.find_by(handle: params[:handle])
	@tweet = Tweet.all
	session[:user_id] = @user.id
	redirect "/users/#{@user.id}"
end