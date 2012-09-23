class AddPositionToSlides < ActiveRecord::Migration
  def change
    add_column :wafflemix_slides, :position, :integer
  end
end
