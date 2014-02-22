class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false

      t.string :session_token, null: false
      t.string :password_digest, null: false

      t.integer :ta_id

      t.timestamps
    end

    add_index :users, :email
    add_index :users, :name
    add_index :users, :session_token
    add_index :users, :ta_id
  end
end
