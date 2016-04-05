class Room < ActiveRecord::Base
  has_many :palaces
  has_many :creators, through: :palaces, source: :creator
  has_many :placements
  has_many :items, through: :placements, source: :item
end
