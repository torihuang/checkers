before '/users/:id' do
  redirect '/' unless logged_in? && params[:id].to_i == current_user.id
end

before '/users' do
  redirect '/session/new' unless logged_in?
end

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

post '/users' do
  puts "in post /users"
  puts params[:user_credentials]
  user = User.new(params[:user_credentials])
  if user.save
    session[:user_id] = user.id
    content_type :json
    {user_id: user.id}.to_json
  else
    status 400
    erb :'_errors', layout: false, locals: {errors: user.errors.full_messages}
  end
end
