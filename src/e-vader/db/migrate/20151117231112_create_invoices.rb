class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.text :description, null: false
      t.float :total_amount, null: false
      t.date :discharge_date, null: false
      t.integer :client_id, null: false
      t.integer :person_id, null: false

      add_foreign_key :invoices, :clients
      add_foreign_key :invoices, :people

      t.timestamps null: false
    end
  end
end
