class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :member_id,      null: false, default: ""
      t.integer :movie_id,       null: false, default: ""
      t.text :review_text,       null: false, default: ""
      t.integer :point,          null: false, default: ""
      t.integer :comment_number, null: false, default: ""

      t.timestamps
    end
  end
end
