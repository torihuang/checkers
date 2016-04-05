get '/' do
  erb :'session/index'
end

get '/session/new' do
  erb :'session/_new', layout: false
end

post '/session' do
  user = User.authenticate(params[:user_credentials])
  if user
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    status 400
    erb :_errors, layout: false, locals: {errors: ["Please enter a valid username and password"]}
  end
end
