<html>
<head>
<title>[% name %]</title>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=ja"></script>
<script type="text/javascript">
function initialize() {
    var myLatlng = new google.maps.LatLng(35.40, 139.46);
    var myOptions = {
      zoom:5,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    [% FOREACH user IN users %]
        marker = new google.maps.Marker({
            position: new google.maps.LatLng([% user.lat %], [% user.lon %]),
            map: map, 
            icon: new google.maps.MarkerImage(
                    'http://usericons.relucks.org/twitter/[% user.screen_name %]',
                    new google.maps.Size(22, 22),
                    new google.maps.Point(0,0),  
                    new google.maps.Point(16,16), 
                    new google.maps.Size(22, 22)
                 ),
            title: '[% user.screen_name %]'
        });

    [% END %]

}
</script>
</head>
<body onload="initialize()">
<div id="header">
<h3>Hello [% name %]</h3>
</div>
