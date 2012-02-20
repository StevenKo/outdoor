class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      
      t.string :title
      t.string :description
      

      t.timestamps
    end
  end
end
