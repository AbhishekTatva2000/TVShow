class AddShowToFavs < ActiveRecord::Migration[7.0]
  def change
    add_column :favs, :show, :integer
  end
end
