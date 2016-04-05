class User < ActiveRecord::Base
  has_many :palaces, foreign_key: :creator_id
  has_many :rooms, through: :palaces, source: :room
  has_many :items, through: :rooms, source: :items
end
