json.array! @bookmarks do |bookmark|
  json.id           bookmark.id
  json.list         bookmark.list
  json.comment      bookmark.comment
  json.place_name   bookmark.place_name
end
