class Group < ApplicationRecord
  has_one_attached :image
  belongs_to :creator, class_name: User.name
end
