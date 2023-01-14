class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.integer :member_id,     null: false, default: ""
      t.integer :genre_id,      null: false, default: ""
      t.string :title,          null: false, default: ""
      t.integer :point,         null: false, default: ""
      t.integer :review_number, null: false, default: ""

      t.timestamps
    end
  end
end
