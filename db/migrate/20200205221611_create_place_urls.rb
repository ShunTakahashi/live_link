class CreatePlaceUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :place_urls do |t|
      t.integer :place_id
      t.integer :live_house_id

      t.timestamps
    end
  end
end
