class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :topic_name, null: false

      t.timestamps(null: false)
    end
  end
end
