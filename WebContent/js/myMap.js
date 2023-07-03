
var directionsDisplay;
var directionsService;
var gmarkers = [];
var waypts = [];
var tollLocations = [];
var tollidsbetweenlocations = [];
var toll_name = new Array();
//var directionsService = new google.maps.DirectionsService();

var map;
var infoWindow = new google.maps.InfoWindow;
var autocompleteOptions = 
{
   types: [],
   componentRestrictions: {country: ["IN"]}
};

var polyline = null;
var bounds = new google.maps.LatLngBounds();

function initialize() 
{
  var mapOptions = {
						center: new google.maps.LatLng(23.2245772,77.1908861),
						zoom: 5,
						zoomControlOptions: 
						{
						  style: google.maps.ZoomControlStyle.LARGE,
						  position: google.maps.ControlPosition.RIGHT_TOP
						},
						mapTypeId: google.maps.MapTypeId.ROADMAP
					};
					
	map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions); 
	
	directionsService = new google.maps.DirectionsService();
	directionsDisplay = new google.maps.DirectionsRenderer();  
	
	directionsDisplay.setMap(map);
	
	
    //Find From location    "Start"
    var fromText = document.getElementById('start');
    var fromAuto = new google.maps.places.Autocomplete(fromText, autocompleteOptions);
    fromAuto.bindTo('bounds', map);
    document.getElementById("divloading1").style.display="none";
   
    //Find To location "End"
    var toText = document.getElementById('end');
    var toAuto = new google.maps.places.Autocomplete(toText, autocompleteOptions);
    toAuto.bindTo('bounds', map);
    document.getElementById("divloading2").style.display="none";

   //Find via location "via"
    var viaText = document.getElementById('via');
	var viaAuto = new google.maps.places.Autocomplete(viaText, {types: ['geocode']});
	viaAuto.bindTo('bounds', map);
	
	//var control = document.getElementById('control');
	//control.style.display = 'block';
	//map.controls[google.maps.ControlPosition.TOP].push(control);
	// Change this depending on the name of your PHP file
	//downloadUrl("phpsqlajax_genxml.php", function(data) {
	
	var rootFlag1 = 0;
	if(rootFlag1)
	{
		downloadUrl("tollmarkers.html", function(data) 
		{
			var xml = data.responseXML;
			tollLocations = xml.documentElement.getElementsByTagName("tollmarker");
			loadData();  
		});
	}
	else
	{
		downloadUrl("tollmarkers.xml", function(data)
		{
			var xml = data.responseXML;
			tollLocations = xml.documentElement.getElementsByTagName("tollmarker");
			loadData();  
		}); // downloadUrl()
	}
 
} // function initialize ()

function isNumber(n) 
{
  return (Object.prototype.toString.call(n) === '[object Number]' || Object.prototype.toString.call(n) === '[object String]') && !isNaN(parseFloat(n)) && isFinite(n.toString().replace(/^-/, ''));
}	

function calcRoute() 
{
	var path;
	//var start = document.getElementById('start').value.toLowerCase();
	//var end = document.getElementById('end').value.toLowerCase();
	var start 		= document.getElementById('start').value;
	var end 		= document.getElementById('end').value;
	var via 		= document.getElementById('via').value;
	
	var triptype 	= document.getElementById("tripType").value;
	var vehicletype = document.getElementById("vehicleMode").value;
	
	if (window.XMLHttpRequest) 
	{	// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttpAjax1 = new XMLHttpRequest();
	} 
	else 
	{	// code for IE6, IE5
		xmlhttpAjax1 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlhttpAjax1.onreadystatechange = function() 
	{
		if (xmlhttpAjax1.readyState == 4 && xmlhttpAjax1.status == 200) 
		{
			//xmlhttpAjax1.onreadystatechange = doNothing;
			//document.getElementById(divName).innerHTML = xmlhttpAjax1.responseText;
			url = xmlhttpAjax1.responseText;
			//alert(url)
			window.location.assign(url);
		}
	};

	//if((start == "") || (end == ""))
	if(start == "")	
	{
		document.getElementById("errorText").innerHTML = "Provide a valid Source City Name";
		document.getElementById('start').focus();
		//document.getElementById('start').highlight();
	}
	else if(end == "")	
	{
		document.getElementById("errorText").innerHTML = "Provide a valid Destination City Name";
		document.getElementById('end').focus();
	}
	else if(isNumber(start)) 
	{
		document.getElementById("errorText").innerHTML = "Please Type a valid Starting Location";
		document.getElementById('start').value = "" ;
		document.getElementById('start').focus();
	}	
	else if(isNumber(end)) 
	{
		document.getElementById("errorText").innerHTML = "Please Type a valid Destination Location";
		document.getElementById('end').value = "" ;
		document.getElementById('end').focus();
	}	
	else
	{
	
		//start = start.replace("Starting From:", "");
		start = start.replace(/Starting From:|Starting From|Starting/gi, "");
		end = end.replace(/Going To:|Going To/gi, "");
		via = via.replace(/Via:/gi, "");
		start = start.trim();
		end = end.trim();
		via = via.trim();
		
		var rootFlag1 = 0;
		//var uri = "../ajax_creatnewfile.php?r=0&s="+start+"&d="+end+"&t="+triptype+"&v="+vehicletype;
		//var uri = "ajax_creatnewfilec445.html?r=0&amp;s="+start+"&d="+end+"&i="+via+"&t="+triptype+"&v="+vehicletype;
		
		///if(rootFlag1)
		//{
			//var uri = "ajax_creatnewfile9870.html?r=1&amp;s="+start+"&d="+end+"&i="+via+"&t="+triptype+"&v="+vehicletype;
		//}
		var res = encodeURI(uri);
		//alert(uri)
		//var divName = "displayTollCharges";
		//document.getElementById(divName).innerHTML = res;
		xmlhttpAjax1.open("GET", res,true);
		xmlhttpAjax1.send();
	}	
}

function loadData() 
{
	var start			= document.getElementById('start').value;
	var end				= document.getElementById('end').value;
	var via		 		= document.getElementById('via').value;
	
	var waypts  = [];
	if(via != "")
	{
		waypts.push({
					location:via,
					stopover:false});
	}
		  
		  
	var distanceinkm 	= 0;

	var request = 
	{
		  origin: start,
		  destination: end,
		  waypoints: waypts,
		  //provideRouteAlternatives: true,
		  travelMode: google.maps.TravelMode.DRIVING
	};
	
	clearPolyLines();
	deleteMarkers();

	directionsService.route(request, function(response, status) 
	{
		if (status == google.maps.DirectionsStatus.OK) 
		{
			directionsDisplay.setDirections(response);
			drawPolyLines(response);
			showMarkersOnRoute(response);	
			document.getElementById("divloading3").style.display="none"; 
			//calculatetollcharges();
		//	alert("Map Loading...");
			calculatetollcharges(response);
			 
		}		
	});
	
   
}  // function calcRoute()


function drawPolyLines(response) 
{
	polyline = new google.maps.Polyline({
								  path: [],
								  fillOpacity: 0,
								  strokeOpacity: 1.0,
								  strokeColor: '#000000',
								  strokeWeight: 0
								});

	var legs = response.routes[0].legs;
	
	for (i=0; i < legs.length; i++) 
	{
	  var steps = legs[i].steps;
	  for (j=0; j <steps.length; j++) 
	  {
		var nextSegment = steps[j].path;
		for (k=0;k < nextSegment.length;k++) 
		{
		  polyline.getPath().push(nextSegment[k]);
		  bounds.extend(nextSegment[k]);
		}
	  }
	}
	polyline.setMap(map);
	map.fitBounds(bounds);
	
}  // drawPolyLines()


// Clear poly lines currently on the map
function clearPolyLines() 
{
	if (polyline != null) 
	{
		polyline.setMap(null);
		polyline = null;
	}
}


function showMarkersOnRoute(response) 
{
	var icon_title = "";
	var templocations;
	var icon_img = "images/marker-icon-1.png";
	
	
	for (var i = 0; i < tollLocations.length; i++) 
	{
		var templocations = new google.maps.LatLng(
			  parseFloat(tollLocations[i].getAttribute("lat")),
			  parseFloat(tollLocations[i].getAttribute("lng")));
				
		if(google.maps.geometry.poly.isLocationOnEdge(templocations, polyline, 0.001))
		{
			icon_title 	= tollLocations[i].getAttribute("name");	  
			var tollid  = tollLocations[i].getAttribute("id");	  
				  
			toll_name.push(icon_title);
		
			icon_title = icon_title + '\n' + 'Click for all Toll Rates';
			var tollurl = '../tolls-on-highways/-toll-plaza-rates.html?id=' + tollid;
			
			 marker = new google.maps.Marker({
				   map: map,
				   position: templocations,
				   icon:  icon_img,
				   title: icon_title,
				   url: tollurl,
				   //animation: google.maps.Animation.BOUNCE
			   });
			gmarkers.push(marker);
			//tollidsbetweenlocations.push(tollLocations[i].getAttribute("id"))
			tollidsbetweenlocations.push(tollid);
			google.maps.event.addDomListener(marker, 'click', function() 
			{
				  window.location.href = this.url;
				  //infowindow.open(map,marker);
				  //echo "<tr class='trclass'><td style='width:75%; font-size:14px;text-align:left;'> &nbsp;
				  // <a href='../showtollplaza.php?id=".$tollid."' title='See all toll rates of ".$tollname."'>".$tollname. "</td> <td style='text-align:center;border-left:5px; font-size:14px;'>".$currenttollchargestring."</td></tr>";		
			});
			
			//var infowindow = new google.maps.InfoWindow({			  content:icon_title 	  });
			//infowindow.open(map,marker);
			/*	
			var html = "<div style='width:75px; height:40px'><b>" + "Click for all toll rates" + "</b>" + "<a href='../showtollplaza.php?id=" + tollid+ "> </div>";
			//var Popuphtml = "<a href='../showtollplaza.php?id="tollid"' title='See all toll rates of ".$tollname."'>";
			var Popuphtml = "<a href='../showtollplaza.php?id=" + tollid+ ">";
			google.maps.event.addDomListener(marker, "mouseover", function() 
			{
				  infowindow.setContent(html);
				  infowindow.open(map, marker);
			});
			*/
			//google.maps.event.addDomListener(marker, 'mouseout',function(){ infowindow.close();});
			
		}
		templocations = null;	
		frm.dis.value = toll_name;
	 }
	
 } // function showMarkersOnRoute(response) 
 
   function markerClick(obj ,infowindow)
   {
		document.getElementById("msg").innerHTML=infowindow;
		document.getElementById("Messages").style.display='block';
		document.getElementById("fadeDiv").style.display='block';
	}

 // Sets the map on all markers in the array.
function setMapOnAll(map) 
{
  for (var i = 0; i < gmarkers.length; i++) 
  {
    gmarkers[i].setMap(map);
  }
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() 
{
  clearMarkers();
  gmarkers = [];
  tollidsbetweenlocations = [];
  waypts = [];
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() 
{
  setMapOnAll(null);
}

function downloadUrl(url, callback) 
{
	if (window.XMLHttpRequest) 
	{	// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp1 = new XMLHttpRequest();
	} 
	else 
	{	// code for IE6, IE5
		xmlhttp1 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp1.onreadystatechange = function() 
	{
		if (xmlhttp1.readyState == 4 && xmlhttp1.status == 200) 
		//if (xmlhttp1.readyState == 4) 
		{
			xmlhttp1.onreadystatechange = doNothing;
			callback(xmlhttp1, xmlhttp1.status);
			//document.getElementById(divName).innerHTML = xmlhttp1.responseText;
		}
	};

	xmlhttp1.open("GET", url ,true);
	xmlhttp1.send(null);
	
}  //function downloadUrl() 


function calculatetollcharges(response) 
{
	//alert("call cal");
	var divName 	= "displayTollCharges";
	var toolidstr   = tollidsbetweenlocations.join();	

	//var divHeaderName 	= "tollcostpanelheading";	
	// 8-June-2016. Fixing the vehicle type to car
	//var vehicletype = "car";
	
	var vehicletype = document.getElementById("vehicleMode").value;
	var triptype    = document.getElementById("tripType").value;
	
	var start 		= document.getElementById('start').value;
	var end 		= document.getElementById('end').value;
	var via		 	= document.getElementById('via').value;
	
	var distanceinkm 	= (response.routes[0].legs[0].distance.value)/1000;  // result comes in meters
	var traveltime 		= response.routes[0].legs[0].duration.text;  // time in text // Format: 2 hours 36 mins
	
	//alert("travvel time :"+traveltime);  
	//traveltime 	= traveltime.replace('hours','H');
	//traveltime 	= traveltime.replace('mins','M');
	//alert("dis :"+distanceinkm);
	var noofplaza=tollidsbetweenlocations.length;
	/*document.getElementById("noofplaza").innerHTML="No. of Toll Gates on route : "+tollidsbetweenlocations.length;
	document.getElementById("distance").innerHTML="Total Distance in Km : "+distanceinkm+"Km";
	document.getElementById("dtime").innerHTML="Driving Time : "+traveltime;*/
	
	if (window.XMLHttpRequest) 
	{	// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp1 = new XMLHttpRequest();
	} 
	else 
	{	// code for IE6, IE5
		xmlhttp1 = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp1.onreadystatechange = function() 
	{
		if (xmlhttp1.readyState == 4 && xmlhttp1.status == 200) 
		{
			xmlhttp1.onreadystatechange = doNothing;
			//document.getElementById("displayTollCharges123").innerHTML = xmlhttp1.responseText;
			document.getElementById(divName).innerHTML = xmlhttp1.responseText;
			
		}
	};
		
	xmlhttp1.open("GET", "calcutateTollCharges.jsp?v="+vehicletype+"&t="+triptype+"&a="+toolidstr+"&d="+distanceinkm+"&s="+traveltime+"&j="+start+"&e="+end+"&vc="+via+"&l="+noofplaza+"&nt="+toll_name,true);
	xmlhttp1.send(null);
	
	
}  //function calculatetollcharges() 
    
function doNothing() {}

function bindInfoWindow(marker, map, infoWindow, html) 
{
	  google.maps.event.addListener(marker, 'click', function() 
	  {
		infoWindow.setContent(html);
		infoWindow.open(map, marker);
	  });
}

function getLiText(point) 
{
	var lat = point.lat(),
		lng = point.lng();
	return "lat: " + lat + " lng: " + lng;
}