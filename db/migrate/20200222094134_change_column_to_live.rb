class ChangeColumnToLive < ActiveRecord::Migration[5.2]
  def change
    change_column :lives, :status, :integer, default: 0
  end
end
