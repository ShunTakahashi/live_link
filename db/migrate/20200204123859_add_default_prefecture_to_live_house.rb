class AddDefaultPrefectureToLiveHouse < ActiveRecord::Migration[5.2]
  def change
    change_column :live_houses, :prefecture, :integer, default: 0
  end
end
