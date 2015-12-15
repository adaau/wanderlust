app.factory('PlaceFactory', PlaceFactory);

PlaceFactory.$inject = ['$resource'];

var url = "<%= ENV['URL'] %>" || "http://localhost:3000";

function PlaceFactory($resource) {
  return $resource('/api/places/:id',
    {id: '@_id'}
  );
}

