class Palace < ActiveRecord::Base
  belongs_to :room
  belongs_to :creator, class_name: 'User'
end
