class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :gender
      t.date :dob
      t.string :phone_number
      t.string :designation
      t.date :date_of_joining

      t.timestamps
    end
  end
end
