class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id, null: false
      t.integer :score

      t.timestamps(null: false)
    end
  end
end
