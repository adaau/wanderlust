class AddListNumberToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :list_number, :integer
  end
end
