# db/migrate/20161126090144_create_users.rb
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, default: ''
      t.string :gender
      t.integer :language_id
      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
