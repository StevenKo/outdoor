class CreateSharePosts < ActiveRecord::Migration
  def change
    create_table :share_posts do |t|
      t.integer :topic_id
      t.integer :user_id
      t.text    :content
      t.string   :title
      t.string :picture
      t.integer :like_count, :default => 0
      t.integer :view_count, :default => 0
      t.boolean :index_slider, :default => false
      t.timestamps
    end
    add_index :share_posts, :topic_id
    add_index :share_posts, :user_id
  end
end
