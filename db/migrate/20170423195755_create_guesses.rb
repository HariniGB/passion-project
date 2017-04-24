class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :point, null: false
      t.integer :game_id, null: false
      t.integer :quiz_id, null: false

      t.timestamps(null: false)
    end
  end
end

