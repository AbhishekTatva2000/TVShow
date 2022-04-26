class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.text :description
      t.datetime :time
      t.references :chanel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
