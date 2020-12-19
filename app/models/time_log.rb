class TimeLog < ApplicationRecord
  validates :name, presence: true
  validates :minutes, presence: true, numericality: true
  belongs_to :user, class_name: User.name
  has_and_belongs_to_many :groups, class_name: 'Group'
end
