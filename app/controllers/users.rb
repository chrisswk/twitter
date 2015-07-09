######################## Andrew and Charlotte

post '/tweets/new' do
  Tweet.create(text: params[:text])
  erb :"users/index"
end
######################## Andrew and Charlotte