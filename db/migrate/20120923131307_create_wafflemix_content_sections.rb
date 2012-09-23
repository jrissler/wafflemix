class CreateWafflemixContentSections < ActiveRecord::Migration
  def change
    create_table :wafflemix_content_sections do |t|
      t.integer :contentable_id
      t.string :contentable_type
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
