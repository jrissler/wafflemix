class CreateWafflemixSlides < ActiveRecord::Migration
  def change
    create_table :wafflemix_slides do |t|
      t.string :name
      t.string :ancestry

      t.timestamps
    end
    add_index :wafflemix_slides, :ancestry
  end
end
