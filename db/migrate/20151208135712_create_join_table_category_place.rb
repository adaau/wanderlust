class CreateJoinTableCategoryPlace < ActiveRecord::Migration
  def change
    create_join_table :categories, :places do |t|
      t.index :category_id
      t.index :place_id
    end
  end
end
