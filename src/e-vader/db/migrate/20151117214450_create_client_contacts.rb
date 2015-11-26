class CreateClientContacts < ActiveRecord::Migration
  def change
    create_table :client_contacts do |t|
      t.belongs_to :client, index: true
      t.belongs_to :contact, index: true
      t.string :value, null: false

      #add_foreign_key :client_contacts, :clients
      #add_foreign_key :client_contacts, :contacts
    end
  end
end
