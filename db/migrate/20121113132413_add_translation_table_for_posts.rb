class AddTranslationTableForPosts < ActiveRecord::Migration
  def up
    Wafflemix::Post.create_translation_table! :title => :string, :body => :text
  end

  def down
    Wafflemix::Post.drop_translation_table!
  end
end
