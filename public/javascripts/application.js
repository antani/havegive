$(document).ready(function() {

var originalBG = $(".list ul li").css("background-color");
var fadeColor = "#ddd";

 $(".list ul li").hover( 
	 function () {
    	$(this).animate( { opacity: 1}, 450 );
  	 },
     function () {
    	$(this).animate( {opacity: 0.5}, 950 );
     }
  );
   
    geocoder = new google.maps.Geocoder();

    $('.delete-icon').bind('ajax:success', function() {
        $(this).closest('tr').fadeOut("linear", showDeletePost);
    });

    $('#map').gmap().bind('init', function(evt, map) {
      $('#map').gmap('getCurrentPosition', function(position, status) {
        if ( status === 'OK' ) {
          var clientPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
          $('#map').gmap('addMarker', {'position': clientPosition, 'bounds': true});
          $('#map').gmap('option', 'center', clientPosition);
        }
      });   
    });

    $(function() {
      $("#address,#actor_address").autocomplete({
        //This bit uses the geocoder to fetch address values
        source: function(request, response) {
          geocoder.geocode( {'address': request.term }, function(results, status) {
            response($.map(results, function(item) {
              return {
                label: item.formatted_address,
                value: item.formatted_address,
                latitude: item.geometry.location.lat(),
                longitude: item.geometry.location.lng()
              }
            }));
          })
        },
        //This bit is executed upon selection of an address
        select: function(event, ui) {
          //$("#latitude").val(ui.item.latitude);
          //$("#longitude").val(ui.item.longitude);
          var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
          //marker.setPosition(location);
          map.setCenter(location);
          map.setZoom(15);
        }
      });
    });
    //Add listener to marker for reverse geocoding
    // google.maps.event.addListener(marker, 'drag', function() {
    //   geocoder.geocode({'latLng': marker.getPosition()}, function(results, status) {
    //     if (status == google.maps.GeocoderStatus.OK) {
    //       if (results[0]) {
    //         $('#address').val(results[0].formatted_address);
    //         $('#latitude').val(marker.getPosition().lat());
    //         $('#longitude').val(marker.getPosition().lng());
    //       }
    //     }
    //   });
    // }); 

});
