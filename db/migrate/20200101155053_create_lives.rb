class CreateLives < ActiveRecord::Migration[5.2]
  def change
    create_table :lives do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.time :open_time
      t.time :start_time
      t.time :end_time
      t.integer :early_bird_ticket_price, null: false
      t.integer :tickets_for_today_price, null: false
      t.string :image
      t.string :time_table_image
      t.text :remarks
      t.integer :status, null: false

      t.timestamps
    end
  end
end
