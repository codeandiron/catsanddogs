$( document ).ready(function(){
  handler = Gmaps.build('Google');
  handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
    $.getJSON('/circles').done(function(circles) {
      _.each(circles, function(circle){
        map_circle = handler.addCircle(circle.circle_data, circle.circle_options);
        handler.bounds.extendWith(map_circle);
      });
      handler.fitMapToBounds();
    }).fail(function() {
      sendMessage("Failed to update events from the server. Please check your internet connection and try again.");
    });
  });
});
