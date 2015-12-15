app.factory('BookmarkFactory', BookmarkFactory);

BookmarkFactory.$inject = ['$resource'];

var url = "<%= ENV['URL'] %>" || "http://localhost:3000";

function BookmarkFactory($resource) {
  return $resource('/api/bookmarks/:id',
    {id: '@_id'}
  );
}
