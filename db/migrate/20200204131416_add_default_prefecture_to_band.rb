class AddDefaultPrefectureToBand < ActiveRecord::Migration[5.2]
  def change
    change_column :bands, :prefecture, :integer, default: 0
  end
end
