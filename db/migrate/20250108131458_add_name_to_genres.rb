class AddNameToGenres < ActiveRecord::Migration[8.0]
  def change
    add_column :genres, :name, :string
  end
end
