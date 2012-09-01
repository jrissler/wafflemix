class CreateWafflemixUserRoles < ActiveRecord::Migration
  def change
    create_table :wafflemix_user_roles do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end

    add_index :wafflemix_user_roles, :user_id
    add_index :wafflemix_user_roles, :role_id
  end
end
