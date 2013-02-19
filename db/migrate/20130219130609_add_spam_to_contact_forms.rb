class AddSpamToContactForms < ActiveRecord::Migration
  def change
    add_column :wafflemix_contact_forms, :spam, :boolean, :default => false, :null => false
  end
end
