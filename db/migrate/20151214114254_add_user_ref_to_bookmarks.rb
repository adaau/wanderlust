class AddUserRefToBookmarks < ActiveRecord::Migration
  def change
    add_reference :bookmarks, :user, index: true, foreign_key: true
  end
end
