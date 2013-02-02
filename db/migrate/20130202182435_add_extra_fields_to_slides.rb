class AddExtraFieldsToSlides < ActiveRecord::Migration
  def change
    add_column :wafflemix_slides, :slide_link, :string
    add_column :wafflemix_slides, :content, :text
  end
end
