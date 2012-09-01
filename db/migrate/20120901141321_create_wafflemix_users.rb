class CreateWafflemixUsers < ActiveRecord::Migration
  def change
    create_table :wafflemix_users do |t|
      t.string :username
      t.string :email
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end

    add_index :wafflemix_users, :username, :unique => true
    add_index :wafflemix_users, :email, :unique => true
    add_index :wafflemix_users, :reset_password_token, :unique => true
  end
end
