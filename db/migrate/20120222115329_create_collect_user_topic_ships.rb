class CreateCollectUserTopicShips < ActiveRecord::Migration
  def change
    create_table :collect_user_topic_ships do |t|
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
    add_index :collect_user_topic_ships, :user_id
    add_index :collect_user_topic_ships, :topic_id
  end
end
