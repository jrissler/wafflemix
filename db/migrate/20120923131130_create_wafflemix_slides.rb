class CreateWafflemixSlides < ActiveRecord::Migration
  def change
    create_table :wafflemix_slides do |t|
      t.string :name

      t.timestamps
    end
  end
end
