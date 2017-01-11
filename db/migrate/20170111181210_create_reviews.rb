class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :rating
      t.text :description
      
      t.timestamps
    end
  end
end
