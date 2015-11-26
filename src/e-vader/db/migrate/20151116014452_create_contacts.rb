class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.string :contact_type, null: false
    end
  end
end
