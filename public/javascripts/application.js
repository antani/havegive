// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


$(document).ready(function() {

/*
var leaflet_map = new L.map('map');
var cloudmadeUrl = 'http://{s}.tile.cloudmade.com/45f8453f62164c808d34b531a46a7bc9/997/256/{z}/{x}/{y}.png',
    cloudmadeAttrib = 'Map data &copy; 2011 OpenStreetMap contributors, Imagery &copy; 2011 CloudMade',
    cloudmade = new L.TileLayer(cloudmadeUrl, {maxZoom: 18, attribution: cloudmadeAttrib});

var london = new L.LatLng(51.505, -0.09); // geographical point (longitude and latitude)
leaflet_map.setView(london, 13).addLayer(cloudmade);
*/
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













  // function gmaps4rails_callback() {
//     Gmaps4Rails.map.setOptions({streetViewControl:false,backgroundColor:transparent});
// }
// gmaps4rails_callback();


// Gmaps4Rails.customClusterer = function() {
//   var url = "http://gmaps-utility-library.googlecode.com/svn/trunk/markerclusterer/1.0/images/";
//   return [{
//     url: url + 'm1.png',
//     height: 26,
//     width: 30,
//   },
//   {
//     url: url + 'm2.png', 
//     height: 35,
//     width: 40,
//   },
//   {
//     url: url + 'm3.png',
//     width: 50,
//     height: 44,
//   }];
// }

});
