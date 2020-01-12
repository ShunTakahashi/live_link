class AddStateToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :name, :string, null: false
    add_column :bands, :prefecture, :integer, null: false
    add_column :bands, :avatar, :string
  end
end
