class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.boolean :role
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :single_access_token
      t.string :perishable_token

      t.timestamps
    end
    add_index :users, :username
    add_index :users, :email
    add_index :users, :perishable_token
  end
end
