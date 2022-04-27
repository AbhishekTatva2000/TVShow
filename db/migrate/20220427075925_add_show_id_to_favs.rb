class AddShowIdToFavs < ActiveRecord::Migration[7.0]
  def change
    add_reference :favs, :show, null: false, foreign_key: true
  end
end
