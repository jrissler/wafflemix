class RemoveBodyFieldFromPages < ActiveRecord::Migration
  def up
    remove_column :pages, :body
  end

  def down
    add_column :pages, :body, :text
  end
end
