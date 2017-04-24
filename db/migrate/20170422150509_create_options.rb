class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :option, null: false
      t.integer :quiz_id, null: false

      t.timestamps(null: false)
    end
  end
end
