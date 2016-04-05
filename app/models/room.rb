class Room < ActiveRecord::Base
  has_many :palaces
  has_many :creators, through: :palaces, source: :user
  has_many :placements
  has_many :objects, through: :placements, source: :object
end
