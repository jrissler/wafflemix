class UpdateDraftToBooleanOnPosts < ActiveRecord::Migration
  def up
    change_column :wafflemix_posts, :draft, :boolean, :default => false, :null => false
  end

  def down
  end
end
