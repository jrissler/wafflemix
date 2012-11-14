class UpdateDraftToBooleanOnPosts < ActiveRecord::Migration
  def up
    remove_column :wafflemix_posts, :draft
    add_column :wafflemix_posts, :draft, :boolean, :default => false, :null => false
  end

  def down
    remove_column :wafflemix_posts, :draft
    add_column :wafflemix_posts, :draft, :boolean
  end
end
