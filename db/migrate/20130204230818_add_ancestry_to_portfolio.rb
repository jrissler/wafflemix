class AddAncestryToPortfolio < ActiveRecord::Migration
  def change
    add_column :wafflemix_portfolios, :ancestry, :string
    add_column :wafflemix_portfolios, :position, :integer
  end
end
