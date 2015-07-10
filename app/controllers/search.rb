post '/search' do
	@handle = params[:handle]
	# erb :search_results
	redirect "/search/#{@handle}"
end

get '/search/:handle' do
	@handle = params[:handle]
	@user = User.find_by(handle: @handle)
	erb :"search/results"
end