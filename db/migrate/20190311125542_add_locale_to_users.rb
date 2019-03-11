class AddLocaleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :locale, :integer, null: false, default: 0
  end
end
