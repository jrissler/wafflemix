class CreateWafflemixContactForms < ActiveRecord::Migration
  def change
    create_table :wafflemix_contact_forms do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
