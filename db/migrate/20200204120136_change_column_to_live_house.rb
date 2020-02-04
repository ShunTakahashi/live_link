class ChangeColumnToLiveHouse < ActiveRecord::Migration[5.2]
  def change
    change_column :live_houses, :prefecture, 'integer USING CAST(prefecture AS integer)'
  end
end
