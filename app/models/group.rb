class Group < ApplicationRecord
  validates :image, presence: true
  has_one_attached :image
  belongs_to :creator, class_name: User.name
  has_and_belongs_to_many :time_logs, class_name: 'TimeLog'

  scope :ordered_by_name, -> { order(name: :asc) }
end
