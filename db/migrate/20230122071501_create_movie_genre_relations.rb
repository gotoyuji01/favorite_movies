class CreateMovieGenreRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :movie_genre_relations do |t|
      t.integer :movie_id,     null: false, default: ""
      t.integer :genre_id,     null: false, default: ""

      t.timestamps
    end
  end
end
