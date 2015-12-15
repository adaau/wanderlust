class AddColumnsToPlace < ActiveRecord::Migration
  def change
    change_table :places do |t|
      t.text :desc1
      t.text :desc2
      t.text :photo_main
    end
  end
end
