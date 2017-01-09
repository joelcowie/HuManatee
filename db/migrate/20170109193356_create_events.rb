class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.integer :creator_id
      t.string :level
      t.string :category
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
