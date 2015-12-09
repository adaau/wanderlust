class AddPlacesToBookmarks < ActiveRecord::Migration
  def change
    add_reference :bookmarks, :place, index: true, foreign_key: true
  end
end
