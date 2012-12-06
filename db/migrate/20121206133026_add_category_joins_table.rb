class AddCategoryJoinsTable < ActiveRecord::Migration
  def change
    create_table :wafflemix_categoricals do |t|
      t.integer :category_id
      t.integer :categorical_id
      t.string :categorical_type

      t.timestamps
    end
    add_index :wafflemix_categoricals, :category_id
    add_index :wafflemix_categoricals, :categorical_id
    add_index :wafflemix_categoricals, :categorical_type
  end
end
