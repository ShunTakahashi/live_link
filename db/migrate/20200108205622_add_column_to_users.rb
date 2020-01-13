class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :ticket_name, :string, null: false
    add_column :users, :avatar, :string
  end
end
