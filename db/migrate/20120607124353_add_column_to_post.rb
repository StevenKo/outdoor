class AddColumnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :like_count, :integer, :default => 0
    add_column :posts, :view_count, :integer, :default => 0
  end
end
