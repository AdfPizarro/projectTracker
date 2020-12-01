class Group < ApplicationRecord
  validates :image, presence:true
  has_one_attached :image
  belongs_to :creator, class_name: User.name
  has_many :log_groups
  has_many :time_logs, through: :log_groups
end
