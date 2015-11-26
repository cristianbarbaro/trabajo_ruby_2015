class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :firstname, null: false
    	t.string :lastname, null: false
    	t.date   :birthdate, null: false
    	t.string :genre, null: false
    	t.string :document_number, null: false
    	t.string :identification_code_type, null: false
    	t.string :identification_code_number, null: false
    end
  end
end
