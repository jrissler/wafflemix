class AddAncestryToPages < ActiveRecord::Migration
  def change
    add_column :wafflemix_pages, :ancestry, :string

    add_index :wafflemix_pages, :ancestry
  end
end
