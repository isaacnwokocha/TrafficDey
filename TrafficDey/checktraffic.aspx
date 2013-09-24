<%@ Page Title="" Language="C#" MasterPageFile="~/td.Master" AutoEventWireup="true" CodeBehind="checktraffic.aspx.cs" Inherits="TrafficDey.checktraffic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="wrapper">
        <article id="location">
            <span id="locationlbl" class="largetext"><span class='glyphicon glyphicon-map-marker'></span>&nbsp;
               Loading location...</span>
            <br />
            <div id="details">
                <span class="largetext indent-left"><span class='glyphicon glyphicon-star-empty'></span>&nbsp;
                <asp:Label runat="server" CssClass="label label-success" ID="lblTraffic"><span class='glyphicon glyphicon-ok'></span>&nbsp;Good</asp:Label>
                </span>
                <br />
                <span class="smallertext indent-left"><span class='glyphicon glyphicon-time'></span>&nbsp;
               <asp:Label runat="server" ID="lblLastUpdate">Last updated 2 mins. ago</asp:Label>
                </span>
                <hr style="margin-bottom: 2px; margin-top: 2px" />
                <span class="largetext" style="font-weight: bold"><span class='glyphicon glyphicon-calendar'></span>&nbsp;History</span>
                <div class="smalltext">
                    <span class='glyphicon glyphicon-time'></span>&nbsp;5 mins ago ...... <span class="label label-warning"><span class='glyphicon glyphicon-warning-sign'></span>&nbsp;Mild</span><br />
                    <span class='glyphicon glyphicon-time'></span>&nbsp;8 mins ago ...... <span class="label label-danger"><span class='glyphicon glyphicon-remove'></span>&nbsp;Bad</span><br />
                    <span class='glyphicon glyphicon-time'></span>&nbsp;12 mins ago ...... <span class="label label-success"><span class='glyphicon glyphicon-ok'></span>&nbsp;Good</span><br />
                    <span class='glyphicon glyphicon-time'></span>&nbsp;20 mins ago ...... <span class="label label-success"><span class='glyphicon glyphicon-ok'></span>&nbsp;Good</span><br />
                    <span class='glyphicon glyphicon-time'></span>&nbsp;22 mins ago ...... <span class="label label-warning"><span class='glyphicon glyphicon-warning-sign'></span>&nbsp;Mild</span>
                </div>
            </div>
            <div id="suggestedloc">
                <hr style="margin-bottom: 2px; margin-top: 2px" />
                <span class="largetext" style="font-weight: bold"><span class='glyphicon glyphicon-calendar'></span>&nbsp;Suggested Locations</span>
                <div class="smalltext">
                    <span class='glyphicon glyphicon-map-marker'></span>&nbsp;<a href="#">Similar location Number 1...</a><br />
                    <span class='glyphicon glyphicon-map-marker'></span>&nbsp;<a href="#">Similar location Number 2...</a>
                    <br />
                    <span class='glyphicon glyphicon-map-marker'></span>&nbsp;<a href="#">Similar location Number 3...</a>
                    <br />
                    <span class='glyphicon glyphicon-map-marker'></span>&nbsp;<a href="#">Similar location Number 4...</a><br />
                    <span class='glyphicon glyphicon-map-marker'></span>&nbsp;<a href="#">Similar location Number 5...</a>
                </div>
            </div>
        </article>
        <div id="mapcanvas" style="height: 600px"></div>
    </section>
    <script type="text/javascript">
        //initialize map to location in query string
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({ 'address': '<%=Request.QueryString["loc"]%>' }, function (results, status) {

            var loc = document.querySelector('#locationlbl');//location label
            var details = document.querySelector('#details');//details container
            var suggLoc = document.querySelector('#suggestedloc');//suggested locations container

            //map loaded successfully
            if (status == google.maps.GeocoderStatus.OK) {

                //set location
                var options = {
                    zoom: 15,
                    position: results[0].geometry.location,
                    center: results[0].geometry.location,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(document.getElementById("mapcanvas"), options);

                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location
                });

                //set location label value
                loc.innerHTML = "<span class='glyphicon glyphicon-map-marker'></span>&nbsp;" + '<%=Request.QueryString["loc"]%>';

                //show details, hide suggestions
                $(document).ready(function () {
                    $('#details').show();
                    $('#suggestedloc').hide();
                });


            }
                //loading map failed
            else {

                //update label, failed.
                loc.innerHTML = "<span class='glyphicon glyphicon-remove'></span>&nbsp;Location could not be loaded.";
                loc.className = "largetext label label-danger";

                //show suggestions, hide details
                $(document).ready(function () {
                    $('#suggestedloc').show();
                    $('#details').hide();
                });
            }
        });
       
    </script>

</asp:Content>
