class CreateTimeLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :time_logs do |t|
      t.references :user, null: false, index: true, foreign_key: { to_table: :users }
      t.string :name
      t.integer :minutes

      t.timestamps
    end
  end
end
