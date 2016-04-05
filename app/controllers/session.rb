get '/' do
  erb :'session/index'
end

get '/session/new' do
  erb :'session/_new', layout: false
end

post '/session' do
  puts params[:user_credentials]
  user = User.authenticate(params[:user_credentials])
  if user
    session[:user_id] = user.id
    content_type :json
    {user_id: user.id}.to_json
  else
    status 400
    erb :_errors, layout: false, locals: {errors: ["Please enter a valid username and password"]}
  end
end

delete '/session' do
  session[:user_id] = nil
end
