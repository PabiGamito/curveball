function reverseGeocode(div) {
  var input = div.value;
  var latlngStr = input.split(',');
  var latlng = new google.maps.LatLng(latlngStr[0], latlngStr[1]);
  geocoder.geocode({'location': latlng}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      if (results[1]) {
        div.value = results[1].formatted_address;
      }
      else {
        window.alert('No results found');
      }
    else {
      window.alert('Geocoder failed due to: ' + status);
    };
  });
}

$(".event-location").each( function() {
  reverseGeocode($(this));
});

google.maps.event.addDomListener(window, 'load', initialize);
console.log("hello");