class CreateFollowBands < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_bands do |t|
      t.references :user, foreign_key: true
      t.references :band, foreign_key: true

      t.timestamps
      t.index [:user_id, :band_id], unique: true
    end
  end
end
