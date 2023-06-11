class CreateHolidays < ActiveRecord::Migration[7.0]
  def change
    create_table :holidays do |t|
      t.date :date
      t.string :occasion
      t.string :day

      t.timestamps
    end
  end
end
