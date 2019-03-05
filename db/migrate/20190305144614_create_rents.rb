class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.date :init_date
      t.date :return_date
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
