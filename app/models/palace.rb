class Palace < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :master, class_name: 'User'
  belongs_to :room

  validates :name, presence: true
end
