class AddSliderToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :index_slider, :boolean, :default => false
  end
end
