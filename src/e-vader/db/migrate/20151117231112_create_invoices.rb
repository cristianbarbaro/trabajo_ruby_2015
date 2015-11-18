class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.text :description
      t.float :total_amount
      t.date :discharge_date
      t.integer :client_id

      add_foreign_key :invoices, :clients	

      t.timestamps null: false
    end
  end
end
