10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Superhero.power, email: Faker::Internet.email, birthday: Faker::Date.between_except(90.year.ago, 1.year.ago, Date.today), password: "password1")
end

5.times do
  Room.create(name: Faker::Hipster.word, image_path: Faker::Avatar.image)
end

30.times do
  Item.create(name: Faker::Hipster.word, image_path: Faker::Avatar.image)
end

50.times do
  random_creator = User.all.to_a.sample
  random_master = User.all.to_a.sample
  random_room = Room.all.to_a.sample
  Palace.create(name: Faker::Hipster.word, creator: random_creator, room: random_room, master: random_master)
end

prng = Random.new
100.times do
  random_room = Room.all.to_a.sample
  random_item = Item.all.to_a.sample
  Placement.create(room: random_room, item: random_item, item_location_x: prng.rand(1000), item_location_y: prng.rand(1000))
end
