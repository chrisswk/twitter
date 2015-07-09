######################## Andrew and Charlotte
get '/tweets/new' do
  erb :"users/index"
end

post '/tweets/new' do
  Tweet.create(text: params[:text])
  erb :"users/index"
end
######################## Andrew and Charlotte