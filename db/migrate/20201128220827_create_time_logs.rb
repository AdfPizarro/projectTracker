class CreateTimeLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :time_logs do |t|
      t.string :author_id
      t.string :name
      t.string :minutes

      t.timestamps
    end
  end
end
