class CreateWafflemixPortfolios < ActiveRecord::Migration
  def change
    create_table :wafflemix_portfolios do |t|
      t.string :title
      t.text :intro
      t.text :content

      t.timestamps
    end
  end
end
