get '/users/:id/rooms/:room_id' do
  user = User.find_by(id: params[:id])
  room = Room.find_by(id: params[:room_id])
  palace = room.find_palace_by_user(user)

  if palace
    erb :'palaces/show', locals: {palace: palace}
  else
    status 400
    erb :'404'
  end
end


get '/rooms/:id/items' do
  room = Room.find_by(id: params[:id])

  if room
    placements = room.placements
    if request.xhr?
      content_type :json
      # {
          # item_name: image_path, placement
      # }
      response_hash = {}
      placements.each do |placement|
        response_hash[placement.item.id] = {name: placement.item.name, image_path: placement.item.image_path, location: [placement.item_location_x, placement.item_location_y]}
      end
      response_hash.to_json
    else
      status 400
      erb :'600'
    end
  else
    status 400
    erb :'404'
  end
end
