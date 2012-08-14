class CreateWafflemixPages < ActiveRecord::Migration
  def change
    create_table :wafflemix_pages do |t|
      t.integer :parent_id
      t.integer :position
      t.boolean :show_in_menu
      t.string :link_url
      t.boolean :deletable
      t.boolean :draft
      t.boolean :skip_to_first

      t.timestamps
    end
  end
end
