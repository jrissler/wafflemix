class CreateWafflemixPosts < ActiveRecord::Migration
  def up
    create_table :wafflemix_posts do |t|
      t.datetime :published_at
      t.string :link_url
      t.string :draft

      t.timestamps
    end

    Wafflemix::Post.create_translation_table! :title => :string, :body => :text
  end

  def down
    drop_table :wafflemix_posts
    Wafflemix::Post.drop_translation_table!
  end
end
