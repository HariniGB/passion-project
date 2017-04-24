class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question, null: false
      t.string :answer, null: false
      t.integer :weight, null: false
      t.integer :topic_id, null: false

      t.timestamps(null: false)
    end
  end
end
