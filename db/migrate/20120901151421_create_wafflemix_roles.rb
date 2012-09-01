class CreateWafflemixRoles < ActiveRecord::Migration
  def change
    create_table :wafflemix_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
