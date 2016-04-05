class Object < ActiveRecord::Base
  has_many :placements
  has_many :rooms, through: :placements, source: :room
  has_many :users, through: :rooms, source: :creators
end
