class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :list
      t.string :comment

      t.timestamps null: false
    end
  end
end
