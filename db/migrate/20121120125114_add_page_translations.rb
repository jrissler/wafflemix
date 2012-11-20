class AddPageTranslations < ActiveRecord::Migration
  def up
    Wafflemix::Page.create_translation_table! :title => :string
  end

  def down
    Wafflemix::Page.drop_translation_table!
  end
end
