class CreateUserReferences < ActiveRecord::Migration
  def change
    create_table :user_references do |t|
      t.integer :target_user_id
      t.integer :follower_user_id

      t.timestamps
    end
    add_index :user_references, :target_user_id
    add_index :user_references, :follower_user_id
  end
end
