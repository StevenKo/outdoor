class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      
      t.integer :board_id
      t.integer :user_id
      t.string  :title
      t.string  :description
      
      t.timestamps
    end
    add_index :topics, :board_id
    add_index :topics, :user_id
  end
end
