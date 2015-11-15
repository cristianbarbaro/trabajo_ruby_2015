class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :firstname
    	t.string :lastname
    	t.string :birthdate
    	t.string :genre
    	t.string :document_number
    	t.string :identification_code_type
    	t.string :identification_code_number
    	t.boolean :client_type 			#Si es persona, es true.

      t.timestamps null: false
    end
  end
end
