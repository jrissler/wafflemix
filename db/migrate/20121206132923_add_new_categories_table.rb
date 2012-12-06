class AddNewCategoriesTable < ActiveRecord::Migration
  def change
    create_table :wafflemix_categories do |t|
      t.string :name
      t.integer :position
      t.string :ancestry

      t.timestamps
    end
  end
end
