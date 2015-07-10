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
	@user = User.new(handle: params[:handle], email: params[:email], password_hash: params[:password_hash])
	@user.password = params[:password_hash]
	if @user.save!
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		status 404
		@error_message = "*************Please enter a valid, unique handle, email, and password.*************"	
		erb :index
	end
end

post '/login' do
	@user = User.find_by_email(params[:email])
	if @user.password == params[:password_hash]
		#give_token
		# session[:user_id] = @user.id
		# @tweet = Tweet.all
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@error_message = "*************Please enter a valid, unique handle, email, and password.*************"
		erb :index
	end
end

get '/home' do
	@user = User.find(session[:user_id])
	@tweet = Tweet.all
	session[:user_id] = @user.id
	redirect "/users/#{@user.id}"
end