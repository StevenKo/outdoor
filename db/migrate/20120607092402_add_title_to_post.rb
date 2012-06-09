class AddTitleToPost < ActiveRecord::Migration
  def change
    add_column :posts, :title, :string
    add_column :posts, :picture, :string
  end
end
