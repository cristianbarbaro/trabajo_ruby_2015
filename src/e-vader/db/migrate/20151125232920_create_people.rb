class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.string :identification_code_type, null: false
      t.string :identification_code_number, null: false
    end
  end
end
