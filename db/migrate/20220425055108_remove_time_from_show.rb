class RemoveTimeFromShow < ActiveRecord::Migration[7.0]
  def change
    remove_column :shows, :time, :datetime
  end
end
