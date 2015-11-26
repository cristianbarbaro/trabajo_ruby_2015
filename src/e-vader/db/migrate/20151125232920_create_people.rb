class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :identification_code_type
      t.string :identification_code_number

      t.timestamps null: false
    end
  end
end
