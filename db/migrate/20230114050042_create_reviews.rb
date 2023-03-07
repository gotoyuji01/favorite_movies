class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :member_id,      null: false
      t.integer :movie_id,       null: false
      t.text :review_text,       null: false
      t.float :point,            null: false
      t.timestamps
    end
  end
end
