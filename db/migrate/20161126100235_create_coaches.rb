# db/migrate/20161126100235_create_coaches.rb
class CreateCoaches < ActiveRecord::Migration[5.0]
  def change
    create_table :coaches do |t|
      t.integer :user_id, null: false
      t.string :gender
      t.text :description
      t.datetime :validation_date
      t.timestamps
    end
    add_index :coaches, :user_id, unique: true
  end
end
