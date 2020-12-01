class TimeLog < ApplicationRecord
 belongs_to :user, class_name: User.name
 has_many :log_groups
 has_many :groups, through: :log_groups
end
