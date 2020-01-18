class CreateGoingToLives < ActiveRecord::Migration[5.2]
  def change
    create_table :going_to_lives do |t|
      t.references :user, foreign_key: true
      t.references :live, foreign_key: true

      t.timestamps
    end
  end
end
