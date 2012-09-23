class RemoveBodyFieldFromPages < ActiveRecord::Migration
  def up
    remove_column :wafflemix_page_translations, :body
  end

  def down
    add_column :wafflemix_page_translations, :body, :text
  end
end
