class CreateCollectUserSharePostShips < ActiveRecord::Migration
  def change
    create_table :collect_user_share_post_ships do |t|
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
    add_index :collect_user_share_post_ships, :user_id
    add_index :collect_user_share_post_ships, :post_id
  end
end
