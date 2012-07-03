class AddUserCounterCache < ActiveRecord::Migration
  def change
    add_column :users, :posts_count, :integer, :default => 0
    add_column :users, :collect_posts_count, :integer, :default => 0
    add_column :users, :fans_count, :integer, :default => 0
    add_column :users, :idols_count, :integer, :default => 0
  end
end
