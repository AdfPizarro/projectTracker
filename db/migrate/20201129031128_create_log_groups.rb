class CreateLogGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :log_groups do |t|
     t.references :log, foreign_key: true
     t.references :group, foreign_key: true
     t.timestamps
    end
  end
end
