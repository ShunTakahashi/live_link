class AddBandRefToLives < ActiveRecord::Migration[5.2]
  def change
    add_reference :lives, :band, foreign_key: true
  end
end
