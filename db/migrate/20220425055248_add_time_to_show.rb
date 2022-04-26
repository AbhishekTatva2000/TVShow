class AddTimeToShow < ActiveRecord::Migration[7.0]
  def change
    add_column :shows, :time, :time
  end
end
