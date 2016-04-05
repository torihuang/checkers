get '/users/new' do
  erb :'users/_new', layout: false
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  if @user
    erb :'users/show'
  else
    erb :'404'
  end
end
