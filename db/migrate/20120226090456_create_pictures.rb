class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :file
      t.text :url
      t.text :url_median
      t.text :url_thumb
      t.timestamps
    end
  end
end
