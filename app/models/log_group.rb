class LogGroup < ApplicationRecord
  belongs_to :group
  belongs_to :log, class_name: TimeLog.name 
end
