class CreateLeave < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.date :from_date
      t.date :to_date
      t.text :reason
      t.string :mail_to
      t.references :employee, null: false, foreign_key: true
      t.timestamps
    end
  end
end
