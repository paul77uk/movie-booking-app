class CreateFavourites < ActiveRecord::Migration[7.0]
  def change
    create_table :favourites do |t|
      t.string :title
      t.string :poster_path
      t.text :overview

      t.timestamps
    end
  end
end
