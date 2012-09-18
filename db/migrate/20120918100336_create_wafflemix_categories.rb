class CreateWafflemixCategories < ActiveRecord::Migration
  def change
    create_table :wafflemix_categories do |t|
      t.integer :categorical_id
      t.string :categorical_type
      t.string :name
      t.integer :position
      t.string :ancestry

      t.timestamps
    end
    add_index :wafflemix_categories, :categorical_id
    add_index :wafflemix_categories, :categorical_type
  end
end
