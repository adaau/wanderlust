class AddPlaceNameToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :place_name, :string
  end
end
