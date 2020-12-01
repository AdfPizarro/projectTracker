class CreateGroupsTimeLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :groups_time_logs do |t|
     t.references :time_log, foreign_key: true
     t.references :group, foreign_key: true
    end
  end
end
