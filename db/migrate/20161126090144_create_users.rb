# db/migrate/20161126090144_create_users.rb
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :password, null: false
      t.string :identification_token
      t.datetime :validation_date
      t.integer :language_id
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :identification_token, unique: true
  end
end
