class RemoveShowFromFavs < ActiveRecord::Migration[7.0]
  def change
    remove_column :favs, :show, :integer
  end
end
