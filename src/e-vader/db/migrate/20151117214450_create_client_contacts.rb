class CreateClientContacts < ActiveRecord::Migration
  def change
    create_table :client_contacts do |t|
      t.integer :client_id
      t.integer :contact_id
      t.string :value

      add_foreign_key :client_contacts, :clients
      add_foreign_key :client_contacts, :contacts

    end
  end
end
