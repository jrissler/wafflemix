class CreateWafflemixPosts < ActiveRecord::Migration
  def up
    create_table :wafflemix_posts do |t|
      t.datetime :published_at
      t.string :link_url
      t.string :draft

      t.timestamps
    end
  end

  def down
    drop_table :wafflemix_posts
  end
end
