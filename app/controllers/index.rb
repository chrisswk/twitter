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

post '/' do
	@tweets = Tweet.all
	@user = User.create(handle: "@"+params[:handle], email: params[:email], password_hash: params[:password_hash])
	session[:user_id] = @user.id
	erb :"users/index"
end