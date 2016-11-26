# db/migrate/20161126095617_create_clients.rb
class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.integer :user_id, null: false
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :phone
      t.date :birthdate
      t.timestamps
    end
    add_index :clients, :user_id, unique: true
  end
end
