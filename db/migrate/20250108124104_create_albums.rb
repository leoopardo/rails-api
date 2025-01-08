class CreateAlbums < ActiveRecord::Migration[8.0]
  def change
    create_table :albums do |t|
      t.references :band, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
