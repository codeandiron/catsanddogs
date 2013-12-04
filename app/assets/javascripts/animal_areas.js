$( document ).ready(function(){
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    $.getJSON('/areas').done(function(areas) { //AJAX request to animal_areas_controller#areas
      _.each(areas, function(area){ //Iteration via underscore.js
        map_area = handler.addCircle(area.data, area.options);
        //Additional methods available on handler:
        //removeMarker or removeMarkers(markers)
        //addMarker or addMarkers(array_of_data, options)
        //addCircle or addCircles(array_of_data, options)
        //addPolyline or addPolylines(array_of_data, options)
        //addPolygon or addPolygons(array_of_data, options)
        //addKml or addKmls(array_of_data, options)
        //See https://github.com/apneadiving/Google-Maps-for-Rails/wiki/Js-Methods
        handler.bounds.extendWith(map_area);
      });
      handler.fitMapToBounds();
    }).fail(function() {
      console.log("Failed to update areas from the server.");
    });
  });
});
