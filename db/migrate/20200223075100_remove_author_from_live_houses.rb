class RemoveAuthorFromLiveHouses < ActiveRecord::Migration[5.2]
  def change
    remove_column :live_houses, :address, :string
  end
end
