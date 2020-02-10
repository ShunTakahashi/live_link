class CreateActUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :act_urls do |t|
      t.integer :act_id
      t.integer :band_id

      t.timestamps
    end
  end
end
