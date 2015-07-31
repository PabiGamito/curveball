var geocoder = new google.maps.Geocoder();

function reverseGeocode(div) {
  var input = div.innerHTML;
  console.log(input)
  var latlngStr = input.split(',');
  var latlng = new google.maps.LatLng(latlngStr[0], latlngStr[1]);
  geocoder.geocode({'location': latlng}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      if (results[0]) {
        console.log(results);
        div.innerHTML = results[0].formatted_address;
      }
      else {
        window.alert('No results found');
      }
  }
    else {
      console.log('Geocoder failed due to: ' + status);
    };  
  });
}

$(".event-location").each( function() {
  if(this.innerHTML){
    reverseGeocode(this);
  };
});

//google.maps.event.addDomListener(window, 'load', initialize);