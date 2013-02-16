class CreateWafflemixMetaContents < ActiveRecord::Migration
  def change
    create_table :wafflemix_meta_contents do |t|
      t.integer :metable_id
      t.string :metable_type
      t.string :meta_title
      t.string :meta_keywords
      t.string :meta_description

      t.timestamps
    end
  end
end
