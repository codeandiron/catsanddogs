$( document ).ready(function(){
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    $.getJSON('/areas').done(function(areas) {
      _.each(areas, function(area){
        map_area = handler.addCircle(area.data, area.options);
        handler.bounds.extendWith(map_area);
      });
      handler.fitMapToBounds();
    }).fail(function() {
      console.log("Failed to update areas from the server.");
    });
  });
});
