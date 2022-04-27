class CreateFavs < ActiveRecord::Migration[7.0]
  def change
    create_table :favs do |t|
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
