class LogGroup < ApplicationRecord
  belongs_to :group
  belongs_to :log, class_name: TimeLog.name

  default_scope { order('created_at ASC') }
end
