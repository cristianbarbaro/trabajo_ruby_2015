class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.string :type
    	
      t.timestamps null: false
    end
  end
end
