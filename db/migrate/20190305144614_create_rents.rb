class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.date :init_date, null: false
      t.date :return_date, null: false
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false

      t.timestamps
    end
  end
end
