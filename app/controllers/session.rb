get '/' do
  erb :'session/index'
end

get '/session/new' do
  erb :'session/_new', layout: false
end
