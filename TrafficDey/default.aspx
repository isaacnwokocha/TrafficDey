<%@ Page Title="" Language="C#" MasterPageFile="~/td.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="TrafficDey._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="wrapper">


        <meta name="viewport" content="width=620" />

        <%--  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>--%>
        <article id="location">
            <span class="largetext"><span class='glyphicon glyphicon-map-marker'></span>&nbsp; Status: <span id="status" class="label label-primary">Checking...</span>
                
                <br />
                <span class="smalltext" id="currentLoc">Loading location...</span>
            </span>
        </article>
        <div id="mapcanvas" style="height: 600px"></div>
        <script type="text/javascript">
            //label for current loc
            var currenLoclbl = document.getElementById('currentLoc');

            //Current status
            var checkStatus = document.querySelector('#status');

            //initialize geocoder
            var geocoder = new google.maps.Geocoder();
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(successFunction, errorFunction);
            }
            else {
                currenLoclbl.innerHTML = "Your browser does not support Geolocation!";
            }
            //Get the latitude and the longitude;
            function successFunction(position) {
                //update status label
                checkStatus.innerHTML = "Found!";
                checkStatus.className = "label label-success";

                //get coords
                var lat = position.coords.latitude;
                var lng = position.coords.longitude;

                //get current location
                codeLatLng(lat, lng);

                //load map of current location
                var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                var myOptions = {
                    zoom: 15,
                    center: latlng,
                    mapTypeControl: false,
                    navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL },
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);

                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map,
                    animation: google.maps.Animation.BOUNCE,
                    title: "You are here! (at least within a " + position.coords.accuracy + " meter radius)"
                });


                var infowindow = new google.maps.InfoWindow({
                    content: "<b>You are here!</b><br/>At least within a " + position.coords.accuracy + " meter radius"
                });

                infowindow.open(map, marker);

            }

            function errorFunction(error) {
                //update status label
                checkStatus.innerHTML = "Not Found!";
                checkStatus.className = "label label-danger";

                switch (error.code) {
                    //user denied permission
                    case error.PERMISSION_DENIED:
                        currenLoclbl.innerHTML = "You barred TrafficDey from getting your location!";
                        break;
                        //position could not be found
                    case error.POSITION_UNAVAILABLE:
                        currenLoclbl.innerHTML = "Your current location could not be loaded. Please try again!";
                        break;
                        //Timeout
                    case error.TIMEOUT:
                        currenLoclbl.innerHTML = "Retrieving your position timed out! Please reload the page.";
                        break;
                        //undefined error
                    default:
                        currenLoclbl.innerHTML = "An error occured. Please Reload the page!";
                        break;
                }

            }

            function codeLatLng(lat, lng) {

                //current user location
                var currentUserLoc;

                var latlng = new google.maps.LatLng(lat, lng);
                geocoder.geocode({ 'latLng': latlng }, function (results, status) {
                    //check if geocoder is OK
                    if (status == google.maps.GeocoderStatus.OK) {
                        console.log(results)
                        if (results[1]) {
                            //update user's current location
                            currenLoclbl.innerHTML = results[0].formatted_address;

                        } else {
                            currenLoclbl.innerHTML = "No results found!";
                        }
                    }
                    else {
                        //geocoder has failed
                        alert("Geocoder failed due to: " + status);
                    }
                });
            }
        </script>
        <%--<script>
            //if loading map succeeds
            function success(position) {
                var s = document.querySelector('#status');

                if (s.className == 'success') {
                    // not sure why we're hitting this twice in FF, I think it's to do with a cached result coming back    
                    return;
                }

                //location's found
                s.innerHTML = "<span class='glyphicon glyphicon-ok'></span>&nbsp;Found!";
                s.className = 'label label-success';

                //create a span and append it to #location
                var loc = document.createElement('span');
                loc.id = "addresslabel";
                loc.innerHTML = "<br /><span class=\"smalltext\">Loading location...</span>";
                document.querySelector('#location').appendChild(loc);


                //display map

                var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                var myOptions = {
                    zoom: 15,
                    center: latlng,
                    mapTypeControl: false,
                    navigationControlOptions: { style: google.maps.NavigationControlStyle.SMALL },
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(document.getElementById("mapcanvas"), myOptions);

                var marker = new google.maps.Marker({
                    position: latlng,
                    map: map,
                    animation: google.maps.Animation.BOUNCE,
                    title: "You are here! (at least within a " + position.coords.accuracy + " meter radius)"
                });


                var infowindow = new google.maps.InfoWindow({
                    content: "<b>You are here</b><br/>At least within a " + position.coords.accuracy + " meter radius"
                });

                infowindow.open(map, marker);

            }

            //if loading map fails
            function error(msg) {
                var s = document.querySelector('#status');
                s.innerHTML = typeof msg == 'string' ? msg : "<span class='glyphicon glyphicon-remove'></span>&nbsp;Found!";

                s.className = 'label label-danger';

                // console.log(arguments);
            }

            //Get current position

            if (navigator.geolocation) {
                //success
                navigator.geolocation.getCurrentPosition(success, error);


            }
                //failure
            else {
                error('not supported');
                var s = document.querySelector('#status');
                s.innerHTML = "Not supported!";
                s.className = "label label-danger";
            }

        </script>--%>
    </section>

</asp:Content>
