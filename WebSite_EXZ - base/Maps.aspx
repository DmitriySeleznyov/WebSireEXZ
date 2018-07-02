<%@ Page Title="Система дистанционного мониторинга и управления ЭХЗ - Карта" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Maps.aspx.cs" Inherits="Maps" %>

<%@ MasterType VirtualPath="~/Site.master" %>

<%@ Register Assembly="DevExpress.Web.v18.1" namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.1" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>





<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <link href="Scripts/css/alertify.css" type="text/css" rel="stylesheet" />
<link href="Scripts/css/alertify.min.css" type="text/css" rel="stylesheet" id="toggleCSS" />
    </asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">

    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBl46lqiISOg4bvGi4ImOw5CeC-6UQNO0w&signed_in=true&callback=initMap"></script>
<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>

<script src="Scripts/alertify.min.js" type="text/javascript"></script>


<script type="text/javascript">

    var markers = [
    <asp:Repeater ID="rptMarkers" runat="server">
    <ItemTemplate>
             {
                "title": '<%# Eval("Name") %>',
                "lat": '<%# Eval("Latitude") %>',
                "lng": '<%# Eval("Longitude") %>',
                "description": '<%# Eval("Description") %>'
            }
    </ItemTemplate>
    <SeparatorTemplate>
        ,
    </SeparatorTemplate>
    </asp:Repeater>
    ];
    </script>


<script type="text/javascript">

    var map;
    var geocoder;
    var scale = 6;
    var coord_lat = [];
    var coord_lon = [];
    var coord_cnt = 0;
    var lat_c = 0;
    var lon_c = 0;
    var getloc = false;
    var BKMU = false;
    var All = true;
    var SDZ = false;
    var BSZ = false;
    var SKZ = false;
    var BKMU_BSZ = false;

    function getXMLDocument(url)   // Загрузка XML-документа
    {
        var req;
        if (window.XMLHttpRequest)   //Opera, FireFox, Chrome
        {
            req = new window.XMLHttpRequest();
            req.open("GET", url, false);
            req.send("");
            return req.responseXML;
        }
        else
            if (window.ActiveXObject)   //IE
            {
                req = new ActiveXObject("Microsoft.XMLDOM");
                req.async = false;
                req.load(url);
                return xml;
            }
            else {
                alert("Загрузка XML не поддерживается браузером");
                return null;
            }
    }

    function FindLocaiton(address1,Name) {

//        geocoder = new google.maps.Geocoder();

        var address = address1;
        var Company = Name;

        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                scale = 15;
                map.setCenter(results[0].geometry.location, map.setZoom(scale));
                window.setTimeout(function () {
                    map.panTo(results[0].geometry.location);
                }, 2000);

                // маркер
                var tinyicon = "Images/Markers/bg.png";

                // содержимое инфоокна
                var contentString = '<div style="text-align:center"><strong>' + Company + '</strong><br><strong>' + address1 + '</strong></div>';
                // создаем инфоокно - при клике переназначается выбранному маркеру с заменой текста
                var infowindow = new google.maps.InfoWindow({});

                var res = results[0].geometry.location;

                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location,
                    title: Name,
                    html: contentString,
                    icon: tinyicon,
                    optimized: false
                });

                // обработчик клика на маркер
                google.maps.event.addListener(marker, "click", function (e) {
                    map.setCenter(this.getPosition());
                    infowindow.setContent(this.html);
                    infowindow.open(map, this);
                });

            }
            else {
                alert("Перевірте адрес: " + adress + " Невдалося знайти координати за адресою: " + status);
            }
        });

        return res;
        }

        function GetLocaiton(lat,lng) {
//            var latlngbounds = new google.maps.LatLngBounds();
//            alert(lat);
//            alert(lng);
            lat_c = lat;
            lon_c = lng;
            getloc = true;
            BKMU = false;
            All = false;
            SDZ = false;
            BSZ = false;
            SKZ = false;
            BKMU_BSZ = false;
            //            lat_c = lat;
//            lon_c = lng;
//            map = google.maps.Map(document.getElementById("map_canvas"));
//            map.setZoom(15);
//            var c = map.getCenter();
//            alert('f');
//            alert(c);
//            var latLng = new google.maps.LatLng(lat_c, lon_c);
//            map.setCenter(latLng);
//            map.panTo(latLng);
//            map.setCenter(latLng);
            //           latlngbounds.extend(new google.maps.LatLng(lat_c, lon_c));

//           map.fitBounds(latlngbounds);
       }


       function ShowMessage(message) {
           alertify.success(message);
       }

       function SKZSet() {
           getloc = false;
           SKZ = true;
           BKMU = false;
           All = false;
           SDZ = false;
           BSZ = false;
           BKMU_BSZ = false;
       }

       function BKMUSet() {
           getloc = false;
           BKMU = true;
           SKZ = false;
           All = false;
           SDZ = false;
           BSZ = false;
           BKMU_BSZ = false;
       }

       function SDZSet() {
           getloc = false;
           SDZ = true;
           SKZ = false;
           All = false;
           BKMU = false;
           BSZ = false;
           BKMU_BSZ = false;
       }

       function AllSet() {
           getloc = false;
           All = true;
           SKZ = false;
           BKMU = false;
           SDZ = false;
           BSZ = false;
           BKMU_BSZ = false;
       }

       function BSZSet() {
           getloc = false;
           BKMU = true;
           SKZ = false;
           All = false;
           SDZ = false;
           BSZ = true;
           BKMU_BSZ = true;
       }

       function getXMLNodeText(node) // Содержимое тэга
    {
        return node.text || node.textContent;
    }

function getBaseURL () 
{ 
        // Get document base path 
        documentBasePath = document.location.href; 
        if (documentBasePath.indexOf('?') != -1) 
                documentBasePath = documentBasePath.substring(0,documentBasePath.indexOf('?')); 
        documentBasePath = documentBasePath.substring(0, 
documentBasePath.lastIndexOf('/')); 
        return( documentBasePath ); 
}


function addMarker(location,title,address,onmap) {

// содержимое инфоокна
var contentString = '<div style="text-align:center"><strong>' + title + '</strong><br><strong>' + address + '</strong></div>';
// создаем инфоокно - при клике переназначается выбранному маркеру с заменой текста
var infowindow = new google.maps.InfoWindow({});
// создаем маркер
var tinyicon = "Images/Markers/bg.png";

var mar = new google.maps.Marker({
    position: location,
    map: onmap,
    title: title,
    html: contentString,
    icon: tinyicon,
    optimized: false
});

// обработчик клика на маркер
google.maps.event.addListener(mar, "click", function (e) {
    map.setCenter(this.getPosition());
    infowindow.setContent(this.html);
    infowindow.open(map, this);
});
}

function SetDistrict() {
    var adminKML = new google.maps.KmlLayer({ url: 'http://gismr.1gb.ua/Admin5.KML' });

    adminKML.setMap(map);
}

function initialize() {

    
//    alert('init');
    var center = new google.maps.LatLng(49.985140, 36.272500);
    var scale = 10;

//    alertify.set('notifier', 'position', 'top-right');

    geocoder = new google.maps.Geocoder();

    geocoder.geocode({ 'address': "Харьков" }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            scale = 10;
            center = new google.maps.LatLng(49.985140, 36.272500);
        }
        else {
            scale = 6;
            center = new google.maps.LatLng(49.368066, 31.681275);
        }
    });

    var myOptions = { //параметры карты
        zoom: scale,
        center: center,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    // создаем карту
    map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);

    // пытаемся загрузить XML-документ БКМУ
    var xml = null;
    try {
        xml = getXMLDocument("markers_bkmu.xml");
        if (!xml) alert("Нет данных");
    }
    catch (e) {
        return alert("Ошибка:" + e.message);
    }
    // получаем информацию о маркерах
    var markers = xml.getElementsByTagName("marker");
    var marker = null;
    var c_markers = [];
    var latlngbounds = new google.maps.LatLngBounds();
    for (var i = 0; i < markers.length; i++) {
        marker = markers[i];
        var params = marker.childNodes;
        if (params)
            for (var i1 = 0; i1 < params.length; i1++) {
                param = params[i1];
                switch (param.nodeName) {
                    case "Name": var Name1 = getXMLNodeText(param);
                        break;
                    case "Latitude": var Lat = getXMLNodeText(param);
                        break;
                    case "Longitude": var Lon = getXMLNodeText(param);
                        break;
                    case "Sum_pot": var Sum_pot = getXMLNodeText(param);
                        break;
                    case "Pol_pot": var Pol_pot = getXMLNodeText(param);
                        break;
                    case "Curr": var Curr = getXMLNodeText(param);
                        break;
                    case "Volt": var Volt = getXMLNodeText(param);
                        break;
                    case "Temper": var Temper = getXMLNodeText(param);
                        break;
                    case "Date": var Dat = getXMLNodeText(param);
                        break;
                }

            }
        // содержимое инфоокна
            var contentString = '<div><div style="text-align:center"><b>' + Name1 + '</b></br>' + '<b>' + Dat + '</b></div><b>Сум. пот. = </b>' +
                        Sum_pot + '</br><b>Пол. пот. = </b>' + Pol_pot + '</br><b>Ток = </b>' + Curr +
                        '</br><b>Напряжение = </b>' + Volt + '</br><b>Температура = </b>' + Temper + '</div>';
            // создаем инфоокно - при клике переназначается выбранному маркеру с заменой текста
        var infowindow = new google.maps.InfoWindow({});
        // создаем маркер
        var image = new google.maps.MarkerImage("Images/Markers/bkmu.png");
        var mar = new google.maps.Marker({
            position: new google.maps.LatLng(Lat, Lon),
            map: map,
            title: Name1,
            html: contentString,
            icon: image
        });

        infowindow.setContent(contentString);
        if (!getloc) { if ((BKMU) | (All)) infowindow.open(map, mar); }
        else {
            if ((Lat == lat_c) & (Lon == lon_c)) {
                infowindow.open(map, mar);
            }
        }

        // обработчик клика на маркер
        google.maps.event.addListener(mar, "click", function (e) {
            map.setCenter(this.getPosition());
            infowindow.setContent(this.html);
            infowindow.open(map, this);
        });


        c_markers.push(mar);
        // Расширяем границы нашей видимой области, добавив координаты нашего текущего маркера
        if ((BKMU) | (All)) { latlngbounds.extend(new google.maps.LatLng(Lat, Lon)); }
    }

       
    // пытаемся загрузить XML-документ БСЗ
    var xml1 = null;
    try {
        xml1 = getXMLDocument("markers_bsz.xml");
        if (!xml1) alert("Нет данных");
    }
    catch (e) {
        return alert("Ошибка:" + e.message);
    }
    // получаем информацию о маркерах
    var markers_bsz = xml1.getElementsByTagName("marker");
    var marker_bsz = null;
    for (var i2 = 0; i2 < markers_bsz.length; i2++) {
        marker_bsz = markers_bsz[i2];
        var params_bsz = marker_bsz.childNodes;
        if (params_bsz)
            for (var i4 = 0; i4 < params_bsz.length; i4++) {
                param_bsz = params_bsz[i4];
                switch (param_bsz.nodeName) {
                    case "Name": var Name_bsz = getXMLNodeText(param_bsz);
                        break;
                    case "Latitude": var Lat_bsz = getXMLNodeText(param_bsz);
                        break;
                    case "Longitude": var Lon_bsz = getXMLNodeText(param_bsz);
                        break;
                    case "Curr": var Curr_bsz = getXMLNodeText(param_bsz);
                        break;
                    case "Volt": var Volt_bsz = getXMLNodeText(param_bsz);
                        break;
                    case "Curr_ust": var Curr_ust_bsz = getXMLNodeText(param_bsz);
                        break;
                    case "Volt_ust": var Volt_ust_bsz = getXMLNodeText(param_bsz);
                        break;
                    case "Date": var Dat1 = getXMLNodeText(param_bsz);
                        break;
                }

            }
        // содержимое инфоокна
            var contentString_bsz = '<div><div style="text-align:center"><b>' + Name_bsz + '</b></br><p><b>' + Dat1 + '</b></p></div><p><b>Ток = </b>' +
                        Curr_bsz + '</p><p><b>Напряжение = </b>' + Volt_bsz + '</p><p><b>Уставка по току = </b>' + Curr_ust_bsz +
                        '</p><p><b>Уставка по напряжению = </b>' + Volt_ust_bsz + '</p></div>';
        // создаем инфоокно - при клике переназначается выбранному маркеру с заменой текста
            var infowindow_bsz = new google.maps.InfoWindow({});
        // создаем маркер
            var image_bsz = new google.maps.MarkerImage("Images/Markers/bsz.png");
            var mar_bsz = new google.maps.Marker({
                position: new google.maps.LatLng(Lat_bsz, Lon_bsz),
            map: map,
            title: Name_bsz,
            html: contentString_bsz,
            icon: image_bsz
        });
        // обработчик клика на маркер

        infowindow_bsz.setContent(contentString_bsz);
        if (!getloc) { if ((BSZ) | (All)) infowindow_bsz.open(map, mar_bsz); }
        else {
            if ((Lat_bsz == lat_c) & (Lon_bsz == lon_c)) {
                infowindow_bsz.open(map, mar_bsz);
            }
        }

        google.maps.event.addListener(mar_bsz, "click", function (e) {
            map.setCenter(this.getPosition());
            infowindow_bsz.setContent(this.html);
            infowindow_bsz.open(map, this);
        });


        c_markers.push(mar_bsz);

        if ((BSZ) | (All)) { latlngbounds.extend(new google.maps.LatLng(Lat_bsz, Lon_bsz)); }
    }

    // пытаемся загрузить XML-документ БКМУ+БСЗ
    var xml11 = null;
    try {
        xml11 = getXMLDocument("markers_bkmu_bsz.xml");
        if (!xml11) alert("Нет данных");
    }
    catch (e) {
        return alert("Ошибка:" + e.message);
    }
    // получаем информацию о маркерах
    var markers_bkmu_bsz = xml11.getElementsByTagName("marker");
    var marker_bkmu_bsz = null;
    for (var i21 = 0; i21 < markers_bkmu_bsz.length; i21++) {
        marker_bkmu_bsz = markers_bkmu_bsz[i21];
        var params_bkmu_bsz = marker_bkmu_bsz.childNodes;
        if (params_bkmu_bsz)
            for (var i41 = 0; i41 < params_bkmu_bsz.length; i41++) {
                param_bkmu_bsz = params_bkmu_bsz[i41];
                switch (param_bkmu_bsz.nodeName) {
                    case "Name": var Name_bkmu_bsz = getXMLNodeText(param_bkmu_bsz);
                        break;
                    case "Latitude": var Lat_bkmu_bsz = getXMLNodeText(param_bkmu_bsz);
                        break;
                    case "Longitude": var Lon_bkmu_bsz = getXMLNodeText(param_bkmu_bsz);
                        break;
                    case "Sum_pot": var Sum_pot_bkmu_bsz = getXMLNodeText(param_bkmu_bsz);
                        break;
                    case "Pol_pot": var Pol_pot_bkmu_bsz = getXMLNodeText(param_bkmu_bsz);
                        break;
                    case "Curr": var Curr_bkmu_bsz = getXMLNodeText(param_bkmu_bsz);
                        break;
                    case "Volt": var Volt_bkmu_bsz = getXMLNodeText(param_bkmu_bsz);
                        break;
                    case "Curr_ust": var Curr_ust_bkmu_bsz = getXMLNodeText(param_bkmu_bsz);
                        break;
                    case "Volt_ust": var Volt_ust_bkmu_bsz = getXMLNodeText(param_bkmu_bsz);
                        break;
                    case "Date": var Dat11 = getXMLNodeText(param_bkmu_bsz);
                        break;
                }

            }
        // содержимое инфоокна
            var contentString_bkmu_bsz = '<div><div style="text-align:center"><b>' + Name_bkmu_bsz + '</b></br><p><b>' + Dat11 + '</b></p></div><p><b>Сум. пот. = </b>' +
             Sum_pot_bkmu_bsz + '</p><p><b>Пол. пот. = </b>' + Pol_pot_bkmu_bsz + '</p><p><b>Ток = </b>' + Curr_bkmu_bsz + '</p><p><b>Напряжение = </b>' 
             + Volt_bkmu_bsz + '</p><p><b>Уставка по току = </b>' + Curr_ust_bkmu_bsz +
                        '</p><p><b>Уставка по напряжению = </b>' + Volt_ust_bkmu_bsz + '</p></div>';
        // создаем инфоокно - при клике переназначается выбранному маркеру с заменой текста
            var infowindow_bkmu_bsz = new google.maps.InfoWindow({});
        // создаем маркер
            var image_bkmu_bsz = new google.maps.MarkerImage("Images/Markers/bsz.png");
            var mar_bkmu_bsz = new google.maps.Marker({
                position: new google.maps.LatLng(Lat_bkmu_bsz, Lon_bkmu_bsz),
            map: map,
            title: Name_bkmu_bsz,
            html: contentString_bkmu_bsz,
            icon: image_bkmu_bsz
        });
        // обработчик клика на маркер

        infowindow_bkmu_bsz.setContent(contentString_bkmu_bsz);
        if (!getloc) { if ((BSZ) | (All)) infowindow_bsz.open(map, mar_bkmu_bsz); }
        else {
            if ((Lat_bkmu_bsz == lat_c) & (Lon_bkmu_bsz == lon_c)) {
                infowindow_bkmu_bsz.open(map, mar_bkmu_bsz);
            }
        }

        google.maps.event.addListener(mar_bkmu_bsz, "click", function (e) {
            map.setCenter(this.getPosition());
            infowindow_bkmu_bsz.setContent(this.html);
            infowindow_bkmu_bsz.open(map, this);
        });


        c_markers.push(mar_bkmu_bsz);

        if ((BSZ) | (All)) { latlngbounds.extend(new google.maps.LatLng(Lat_bkmu_bsz, Lon_bkmu_bsz)); }
    }


    // пытаемся загрузить XML-документ СДЗ
    var xml3 = null;
    try {
        xml3 = getXMLDocument("markers_sdz.xml");
        if (!xml3) alert("Нет данных");
    }
    catch (e) {
        return alert("Ошибка:" + e.message);
    }
    // получаем информацию о маркерах
    var markers_sdz = xml3.getElementsByTagName("marker");
    var marker_sdz = null;
    for (var i5 = 0; i5 < markers_sdz.length; i5++) {
        marker_sdz = markers_sdz[i5];
        var params_sdz = marker_sdz.childNodes;
        if (params_sdz)
            for (var i6 = 0; i6 < params_sdz.length; i6++) {
                param_sdz = params_sdz[i6];
                switch (param_sdz.nodeName) {
                    case "Name": var Name_sdz = getXMLNodeText(param_sdz);
                        break;
                    case "Latitude": var Lat_sdz = getXMLNodeText(param_sdz);
                        break;
                    case "Longitude": var Lon_sdz = getXMLNodeText(param_sdz);
                        break;
                    case "Curr": var Curr_sdz = getXMLNodeText(param_sdz);
                        break;
                    case "Volt": var Volt_sdz = getXMLNodeText(param_sdz);
                        break;
                    case "Pot_tz": var Pot_tz_sdz = getXMLNodeText(param_sdz);
                        break;
                    case "Pot_rz": var Pot_rz_sdz = getXMLNodeText(param_sdz);
                        break;
                    case "Date": var Dat_sdz = getXMLNodeText(param_sdz);
                        break;
                }

            }
        // содержимое инфоокна
            var contentString_sdz = '<div><div style="text-align:center"><b>' + Name_sdz + '</b></br><b>' + Dat_sdz + '</b></div><b>Ток = </b>' +
                        Curr_sdz + '</br><b>Напряжение АКБ = </b>' + Volt_sdz + '</br><b>Потенциал "т-з" = </b>' + Pot_tz_sdz +
                        '</br><b>Потенциал "р-з" = </b>' + Pot_rz_sdz + '</div>';
            var infowindow_sdz = new google.maps.InfoWindow({});
        // создаем маркер
            var image_sdz = new google.maps.MarkerImage("Images/Markers/sdz.png");
            var mar_sdz = new google.maps.Marker({
                position: new google.maps.LatLng(Lat_sdz, Lon_sdz),
            map: map,
            title: Name_sdz,
            html: contentString_sdz,
            icon: image_sdz
        });
        // создаем инфоокно - при клике переназначается выбранному маркеру с заменой текста

        // обработчик клика на маркер

        infowindow_sdz.setContent(contentString_sdz);

        if (!getloc) { if ((SDZ) | (All)) infowindow_sdz.open(map, mar_sdz); }
        else {
        if ((Lat_sdz == lat_c) & (Lon_sdz == lon_c))
        {
            infowindow_sdz.open(map, mar_sdz);
        }
        }

        google.maps.event.addListener(mar_sdz, "click", function (e) {
            map.setCenter(this.getPosition());
            infowindow_sdz.setContent(this.html);
            infowindow_sdz.open(map, this);
        });


        c_markers.push(mar_sdz);

        if ((SDZ) | (All)) { latlngbounds.extend(new google.maps.LatLng(Lat_sdz, Lon_sdz)); }
        
    }


    // пытаемся загрузить XML-документ СКЗ
    var xml_skz = null;
    try {
        xml_skz = getXMLDocument("markers_skz.xml");
        if (!xml_skz) alert("Нет данных");
    }
    catch (e) {
        return alert("Ошибка:" + e.message);
    }
    // получаем информацию о маркерах
    var markers_skz = xml_skz.getElementsByTagName("marker");
    var marker_skz = null;
    for (var ik = 0; ik < markers_skz.length; ik++) {
        marker_skz = markers_skz[ik];
        var params_skz = marker_skz.childNodes;
        if (params_skz)
            for (var i7 = 0; i7 < params.length; i7++) {
                param_skz = params_skz[i7];
                switch (param_skz.nodeName) {
                    case "Name": var Name_skz = getXMLNodeText(param_skz);
                        break;
                    case "Latitude": var Lat_skz = getXMLNodeText(param_skz);
                        break;
                    case "Longitude": var Lon_skz = getXMLNodeText(param_skz);
                        break;
                    case "Sum_pot": var Sum_pot_skz = getXMLNodeText(param_skz);
                        break;
                    case "Pol_pot": var Pol_pot_skz = getXMLNodeText(param_skz);
                        break;
                    case "Curr": var Curr_skz = getXMLNodeText(param_skz);
                        break;
                    case "Volt": var Volt_skz = getXMLNodeText(param_skz);
                        break;
                    case "Temper": var Temper_skz = getXMLNodeText(param_skz);
                        break;
                    case "Date": var Dat_skz = getXMLNodeText(param_skz);
                        break;
                }

            }
        // содержимое инфоокна
            var contentString_skz = '<div><div style="text-align:center"><b>' + Name_skz + '</b></br>' + '<b>' + Dat_skz + '</b></div><b>Сум. пот. = </b>' +
                        Sum_pot_skz + '</br><b>Пол. пот. = </b>' + Pol_pot_skz + '</br><b>Ток = </b>' + Curr_skz +
                        '</br><b>Напряжение = </b>' + Volt_skz + '</br><b>Температура = </b>' + Temper_skz + '</div>';
        // создаем инфоокно - при клике переназначается выбранному маркеру с заменой текста
            var infowindow_skz = new google.maps.InfoWindow({});
        // создаем маркер
            var image_skz = new google.maps.MarkerImage("Images/Markers/mtdu.png");
            var mar_skz = new google.maps.Marker({
                position: new google.maps.LatLng(Lat_skz, Lon_skz),
            map: map,
            title: Name_skz,
            html: contentString_skz,
            icon: image_skz
        });

        infowindow_skz.setContent(contentString_skz);

        if (!getloc) { if ((SKZ) | (All)) infowindow_skz.open(map, mar_skz); }
        else {
            if ((Lat_skz == lat_c) & (Lon_skz == lon_c)) {
                infowindow_skz.open(map, mar_skz);
            }
        }

        google.maps.event.addListener(mar_skz, "click", function (e) {
            map.setCenter(this.getPosition());
            infowindow_skz.setContent(this.html);
            infowindow_skz.open(map, this);
        });


        c_markers.push(mar_skz);

        if ((SKZ) | (All)) { latlngbounds.extend(new google.maps.LatLng(Lat_skz, Lon_skz)); }

    }



    if ((SDZ) | (All) | (BSZ) | (BKMU) | (SKZ)) { map.fitBounds(latlngbounds); }

    var markerCluster = new MarkerClusterer(map, c_markers, {
        imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m',
        gridSize: 20,
        minimumClusterSize: 5,
        calculator: function (c_markers, numStyles) {
            return {
                text: c_markers.length,
                index: numStyles
            };
        }
    });

    if (lat_c != 0) {
//        alert(lat_c);
//        alert(lon_c);
        //        map.setZoom(15);
        var latLng = new google.maps.LatLng(lat_c, lon_c);
        map.panTo(latLng);
        map.setCenter(latLng);
        //
    }

//    for (cnt in c_markers) {
//        c_markers[cnt - 1]['infowindow'].open(map, c_markers[cnt - 1]);
//    }

}

    window.onload = initialize;
</script>

<div id="map_canvas">
</div> 

    <dx:ASPxPageControl ID="ASPxPageControl2" runat="server" ActiveTabIndex="0" 
        Theme="Youthful" Width="100%">
        <TabPages>
            <dx:TabPage Text="Мониторинг">
                <TabImage IconID="chart_fullstackedline_16x16">
                </TabImage>
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <table>
                        <tr>
                        <td>

                        <table>
                        <tr>
                        <td>
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl34" runat="server" BackColor="White" 
                                Height="20px" Value="3" Width="20px">
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="3">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            Включена<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl30" runat="server" 
                                BackColor="White" Height="20px" Value="3" Width="20px">
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="3">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            Состояние связи<br /></td>
                        <td>

                            Последний опрос<br /><dx:ASPxGaugeControl 
                                ID="ASPxGaugeControl35" runat="server" BackColor="White" Height="40px" 
                                Value="06.04.2017 19:58:17" Width="180px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 180, 40" DigitCount="15" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="06.04.2017 19:58:17">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="739.437561, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                        </td>
                        <td>
                            <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Опросить">
                            </dx:ASPxButton>
                        </td>
                        </tr>
                        </table>

                        <dx:ASPxPageControl ID="ASPxPageControl3" runat="server" ActiveTabIndex="0" 
                                Theme="Youthful">
                            <TabPages>
                                <dx:TabPage Text="Канал 1">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <table>
                                            <tr>
                                            <td>
                                                <dx:ASPxGaugeControl ID="ASPxGaugeControl31" runat="server" BackColor="White" 
                                                    Height="20px" Value="3" Width="20px">
                                                    <Gauges>
                                                        <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                                            <indicators>
                                                                <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                                    Name="stateIndicatorComponent1" Size="200, 200" StateIndex="3">
                                                                    <states>
                                                                        <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                                        <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                                        <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                                        <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                                    </states>
                                                                </dx:StateIndicatorComponent>
                                                            </indicators>
                                                        </dx:StateIndicatorGauge>
                                                    </Gauges>
                                                    <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                                </dx:ASPxGaugeControl>
                                                Включен<br />Активный режим<dx:ASPxTextBox ID="ASPxTextBox1" runat="server" 
                                                Width="300px" Text="стабилизация по суммарному потенциалу">
                                            </dx:ASPxTextBox>
                                            </td>
                                            </tr>
                                            <tr>
                                            <td width="100%">
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl6" runat="server" BackColor="White" 
                                                Height="140px" LayoutInterval="6" Value="7" Width="140px">
                                                <Gauges>
                                                    <dx:CircularGauge Bounds="6, 6, 148, 148" Name="circularGauge10">
                                                        <scales>
                                                            <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 9pt" 
                                                                Center="125, 170" EndAngle="0" MajorTickCount="6" 
                                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-6" 
                                                                MajorTickmark-ShapeType="Circular_Style25_1" MajorTickmark-TextOffset="-20" 
                                                                MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" 
                                                                MinorTickmark-ShapeOffset="-2" MinorTickmark-ShapeType="Circular_Style25_2" 
                                                                Name="scale1" RadiusX="95" RadiusY="95" StartAngle="-180" Value="1">
                                                                <ranges>
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#9EC968&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="33" Name="Range0" ShapeOffset="11.5" 
                                                                        StartThickness="2" />
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFDA80&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="66" Name="Range1" ShapeOffset="11.5" 
                                                                        StartThickness="2" StartValue="33" />
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E99D9D&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="100" Name="Range2" ShapeOffset="11.5" 
                                                                        StartThickness="2" StartValue="66" />
                                                                </ranges>
                                                            </dx:ArcScaleComponent>
                                                        </scales>
                                                        <backgroundlayers>
                                                            <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" 
                                                                ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style25" 
                                                                Size="200, 145" ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <needles>
                                                            <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="13" 
                                                                Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style25" 
                                                                StartOffset="-16.5" ZOrder="-50" />
                                                        </needles>
                                                        <markers>
                                                            <dx:ArcScaleMarkerComponent AcceptOrder="100" ArcScale="" 
                                                                Name="circularGauge10_Marker1" ScaleID="scale1" ZOrder="-100" />
                                                        </markers>
                                                        <spindlecaps>
                                                            <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                                                                Name="circularGauge10_SpindleCap1" ScaleID="scale1" 
                                                                ShapeType="CircularFull_Style25" Size="15, 15" ZOrder="-100" />
                                                        </spindlecaps>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" Name="circularGauge10_Label1" 
                                                                Text="Ток, А" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:CircularGauge>
                                                </Gauges>
                                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />

<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl7" runat="server" BackColor="White" 
                                                Height="140px" LayoutInterval="6" Value="48" Width="140px">
                                                <Gauges>
                                                    <dx:CircularGauge Bounds="6, 6, 148, 148" Name="circularGauge10">
                                                        <scales>
                                                            <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 9pt" 
                                                                Center="125, 170" EndAngle="0" MajorTickCount="6" 
                                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-6" 
                                                                MajorTickmark-ShapeType="Circular_Style25_1" MajorTickmark-TextOffset="-20" 
                                                                MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" 
                                                                MinorTickmark-ShapeOffset="-2" MinorTickmark-ShapeType="Circular_Style25_2" 
                                                                Name="scale1" RadiusX="95" RadiusY="95" StartAngle="-180" Value="1">
                                                                <ranges>
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#9EC968&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="33" Name="Range0" ShapeOffset="11.5" 
                                                                        StartThickness="2" />
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFDA80&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="66" Name="Range1" ShapeOffset="11.5" 
                                                                        StartThickness="2" StartValue="33" />
                                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E99D9D&quot;/&gt;" 
                                                                        EndThickness="2" EndValue="100" Name="Range2" ShapeOffset="11.5" 
                                                                        StartThickness="2" StartValue="66" />
                                                                </ranges>
                                                            </dx:ArcScaleComponent>
                                                        </scales>
                                                        <backgroundlayers>
                                                            <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" 
                                                                ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style25" 
                                                                Size="200, 145" ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <needles>
                                                            <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="13" 
                                                                Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style25" 
                                                                StartOffset="-16.5" ZOrder="-50" />
                                                        </needles>
                                                        <markers>
                                                            <dx:ArcScaleMarkerComponent AcceptOrder="100" ArcScale="" 
                                                                Name="circularGauge10_Marker1" ScaleID="scale1" ZOrder="-100" />
                                                        </markers>
                                                        <spindlecaps>
                                                            <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                                                                Name="circularGauge10_SpindleCap1" ScaleID="scale1" 
                                                                ShapeType="CircularFull_Style25" Size="15, 15" ZOrder="-100" />
                                                        </spindlecaps>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" Name="circularGauge10_Label1" 
                                                                Text="Напряжение, В" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:CircularGauge>
                                                </Gauges>
                                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />

<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl10" runat="server" BackColor="White" 
                                                Height="140px" LayoutInterval="6" Value="0" Width="70px">
                                                <Gauges>
                                                    <dx:LinearGauge Bounds="6, 6, 248, 248" Name="linearGauge9">
                                                        <scales>
                                                            <dx:LinearScaleComponent AcceptOrder="0" 
                                                                AppearanceTickmarkText-Font="Tahoma, 8pt" CustomLogarithmicBase="2" 
                                                                EndPoint="62.5, 38" MajorTickCount="6" MajorTickmark-FormatString="{0:F0}" 
                                                                MajorTickmark-ShapeOffset="-25" MajorTickmark-ShapeType="Linear_Style25_1" 
                                                                MajorTickmark-TextOffset="-35" MaxValue="0" MinorTickCount="4" 
                                                                MinorTickmark-ShapeOffset="-22" MinorTickmark-ShapeType="Linear_Style25_2" 
                                                                Name="scale1" StartPoint="62.5, 212" MinValue="-3000">
                                                                <ranges>
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1D183&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-1000" Name="Range0" ShapeOffset="-12" 
                                                                        StartThickness="3" />
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1877E&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-3000" Name="Range1" ShapeOffset="-12" 
                                                                        StartThickness="3" StartValue="-2500" />
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#7AC463&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-2500" Name="Range2" ShapeOffset="-12" 
                                                                        StartThickness="3" StartValue="-1000" />
                                                                </ranges>
                                                            </dx:LinearScaleComponent>
                                                        </scales>
                                                        <levels>
                                                            <dx:LinearScaleLevelComponent AcceptOrder="50" LinearScale="" Name="level1" 
                                                                ScaleID="scale1" ShapeType="Style25" ZOrder="-50" />
                                                        </levels>
                                                        <backgroundlayers>
                                                            <dx:LinearScaleBackgroundLayerComponent AcceptOrder="-1000" LinearScale="" 
                                                                Name="bg1" ScaleID="scale1" ScaleStartPos="0.5, 0.85" 
                                                                ShapeType="Linear_Style25" ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Tahoma, 12pt" 
                                                                Name="linearGauge9_Label1" Position="93.1, 116.7" Text="Суммарный потенциал, мВ" 
                                                                TextOrientation="BottomToTop" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:LinearGauge>
                                                </Gauges>
                                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />

<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl11" runat="server" BackColor="White" 
                                                Height="140px" LayoutInterval="6" Value="0" Width="70px">
                                                <Gauges>
                                                    <dx:LinearGauge Bounds="6, 6, 58, 128" Name="linearGauge9">
                                                        <scales>
                                                            <dx:LinearScaleComponent AcceptOrder="0" 
                                                                AppearanceTickmarkText-Font="Tahoma, 8pt" CustomLogarithmicBase="2" 
                                                                EndPoint="62.5, 38" MajorTickCount="6" MajorTickmark-FormatString="{0:F0}" 
                                                                MajorTickmark-ShapeOffset="-25" MajorTickmark-ShapeType="Linear_Style25_1" 
                                                                MajorTickmark-TextOffset="-35" MaxValue="0" MinorTickCount="4" 
                                                                MinorTickmark-ShapeOffset="-22" MinorTickmark-ShapeType="Linear_Style25_2" 
                                                                MinValue="-3000" Name="scale1" StartPoint="62.5, 212">
                                                                <ranges>
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1D183&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-850" Name="Range0" ShapeOffset="-12" 
                                                                        StartThickness="3" />
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1877E&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-3000" Name="Range1" ShapeOffset="-12" 
                                                                        StartThickness="3" StartValue="-1150" />
                                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#7AC463&quot;/&gt;" 
                                                                        EndThickness="3" EndValue="-1150" Name="Range2" ShapeOffset="-12" 
                                                                        StartThickness="3" StartValue="-850" />
                                                                </ranges>
                                                            </dx:LinearScaleComponent>
                                                        </scales>
                                                        <levels>
                                                            <dx:LinearScaleLevelComponent AcceptOrder="50" LinearScale="" Name="level1" 
                                                                ScaleID="scale1" ShapeType="Style25" ZOrder="-50" />
                                                        </levels>
                                                        <backgroundlayers>
                                                            <dx:LinearScaleBackgroundLayerComponent AcceptOrder="-1000" LinearScale="" 
                                                                Name="bg1" ScaleID="scale1" ScaleStartPos="0.5, 0.85" 
                                                                ShapeType="Linear_Style25" ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Tahoma, 12pt" 
                                                                Name="linearGauge9_Label1" Position="93.1, 116.7" 
                                                                Text="Поляризационный потенциал, мВ" TextOrientation="BottomToTop" 
                                                                ZOrder="-1001" />
                                                        </labels>
                                                    </dx:LinearGauge>
                                                </Gauges>
                                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                                                
<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                                <br />
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl8" runat="server" BackColor="White" 
                                                Height="30px" Value="07,500" Width="140px">
                                                <Gauges>
                                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                                        Bounds="0, 0, 160, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                                        Text="07,500">
                                                        <backgroundlayers>
                                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                                ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" 
                                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:DigitalGauge>
                                                </Gauges>
                                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl9" runat="server" BackColor="White" 
                                                Height="30px" Value="48,800" Width="140px">
                                                <Gauges>
                                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                                        Bounds="0, 0, 160, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                                        Text="48,800">
                                                        <backgroundlayers>
                                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                                ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" 
                                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:DigitalGauge>
                                                </Gauges>
                                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl12" runat="server" BackColor="White" 
                                                Height="30px" Value="-1200" Width="70px">
                                                <Gauges>
                                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                                        Text="-1200">
                                                        <backgroundlayers>
                                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                                ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" 
                                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:DigitalGauge>
                                                </Gauges>
                                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                            <dx:ASPxGaugeControl ID="ASPxGaugeControl13" runat="server" BackColor="White" 
                                                Height="30px" Value="-900" Width="70px">
                                                <Gauges>
                                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                                        Bounds="0, 0, 70, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                                        Text="-900">
                                                        <backgroundlayers>
                                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                                ZOrder="1000" />
                                                        </backgroundlayers>
                                                        <labels>
                                                            <dx:LabelComponent AcceptOrder="1001" 
                                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                                        </labels>
                                                    </dx:DigitalGauge>
                                                </Gauges>
                                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                            </dx:ASPxGaugeControl>
                                                <br />
                                                Температура, С<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl33" runat="server" 
                                                    BackColor="White" Height="30px" Value="+33,5" Width="140px">
                                                    <Gauges>
                                                        <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                                            AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                                            Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                                            Text="+33,5">
                                                            <backgroundlayers>
                                                                <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                                    BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                                    ZOrder="1000" />
                                                            </backgroundlayers>
                                                            <labels>
                                                                <dx:LabelComponent AcceptOrder="1001" 
                                                                    AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                                    Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                                            </labels>
                                                        </dx:DigitalGauge>
                                                    </Gauges>
                                                    <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                                </dx:ASPxGaugeControl>
                                            </td>
                                            </tr>
                                            </table>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 2">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 3">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 4">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 5">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 6">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>
                        </td>
                        <td>

                            <b>Состояние</b><br /><dx:ASPxGaugeControl ID="ASPxGaugeControl4" runat="server" BackColor="White" 
                            Height="20px" Value="1" Width="20px">
                            <Gauges>
                                <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                    <indicators>
                                        <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                            Name="stateIndicatorComponent1" Size="200, 200" StateIndex="1">
                                            <states>
                                                <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                            </states>
                                        </dx:StateIndicatorComponent>
                                    </indicators>
                                </dx:StateIndicatorGauge>
                            </Gauges>
                            <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                        </dx:ASPxGaugeControl>

                            Двери<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl14" runat="server" 
                                BackColor="White" Height="20px" Value="1" Width="20px">
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="1">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            Откл. электропитания<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl15" 
                                runat="server" BackColor="White" Height="20px" Value="1" Width="20px">
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="1">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            Отказ преобразователя<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl16" 
                                runat="server" BackColor="White" Height="20px" Value="1" Width="20px">
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="1">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            Сбой изм. канала ЭС<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl17" 
                                runat="server" BackColor="White" Height="20px" Value="1" Width="20px">
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="1">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            Защитный ток около 0<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl18" 
                                runat="server" BackColor="White" Height="20px" Value="1" Width="20px">
                                <Gauges>
                                    <dx:StateIndicatorGauge Bounds="0, 0, 20, 20" Name="Gauge0">
                                        <indicators>
                                            <dx:StateIndicatorComponent AcceptOrder="0" Center="124, 124" 
                                                Name="stateIndicatorComponent1" Size="200, 200" StateIndex="1">
                                                <states>
                                                    <dx:IndicatorStateWeb Name="State1" ShapeType="ElectricLight1" />
                                                    <dx:IndicatorStateWeb Name="State2" ShapeType="ElectricLight2" />
                                                    <dx:IndicatorStateWeb Name="State3" ShapeType="ElectricLight3" />
                                                    <dx:IndicatorStateWeb Name="State4" ShapeType="ElectricLight4" />
                                                </states>
                                            </dx:StateIndicatorComponent>
                                        </indicators>
                                    </dx:StateIndicatorGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            Аккумулятор разряженный<br /><br /><b>Последние дата и время</b><br /><br/><b>Электропитание</b><br />- 
                            отключение<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl27" runat="server" 
                                BackColor="White" Height="40px" Value="14.03.2017 09:01:56" Width="180px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 180, 40" DigitCount="15" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="14.03.2017 09:01:56">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="739.437561, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            <br />
                            - включение<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl28" runat="server" 
                                BackColor="White" Height="40px" Value="14.03.2017 09:03:39" Width="180px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 180, 40" DigitCount="15" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="14.03.2017 09:03:39">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="739.437561, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            <br /><br/>
                            <b>Двери</b><br />- открытие<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl25" 
                                runat="server" BackColor="White" Height="40px" Value="14.03.2017 09:04:51" 
                                Width="180px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 180, 40" DigitCount="15" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="14.03.2017 09:04:51">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="739.437561, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            <br />
                            - закрытие<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl26" runat="server" 
                                BackColor="White" Height="40px" Value="14.03.2017 09:05:25" Width="180px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 180, 40" DigitCount="15" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="14.03.2017 09:05:25">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="739.437561, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            <br /></td>
                        <td>
                            Наличие электропитания<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl32" 
                                runat="server" BackColor="White" Height="30px" Value="220" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="220">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            <br />
                            <br />
                            <br />
                            Энергозатраты, кВт/ч<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl19" 
                                runat="server" BackColor="White" Height="30px" Value="0365,5" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="0365,5">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            <br />
                            <br />
                            Мощность, кВт<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl21" runat="server" 
                                BackColor="White" Height="30px" Value="0,37" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="0,37">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            <br />Загрузка по мощности<br /><dx:ASPxGaugeControl 
                                ID="ASPxGaugeControl3" runat="server" BackColor="White" Height="50px" Value="1" 
                                Width="140px">
                                <Gauges>
                                    <dx:LinearGauge Bounds="0, 0, 140, 50" Name="Level_Bars" 
                                        Orientation="Horizontal">
                                        <scales>
                                            <dx:LinearScaleComponent AcceptOrder="0" 
                                                AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                CustomLogarithmicBase="2" EndPoint="62.5, 225" MajorTickCount="2" 
                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-20" 
                                                MajorTickmark-ShapeType="Linear_Style1_1" MajorTickmark-ShowText="False" 
                                                MajorTickmark-ShowTick="False" MajorTickmark-TextOffset="-32" MaxValue="100" 
                                                MinorTickCount="0" MinorTickmark-ShapeOffset="-14" 
                                                MinorTickmark-ShapeType="Linear_Style1_2" MinorTickmark-ShowTick="False" 
                                                Name="scale1" StartPoint="62.5, 25" Value="1">
                                                <labels>
                                                    <dx:ScaleLabelWeb AppearanceText-Font="Tahoma, 16pt, style=Bold" 
                                                        FormatString="{0} {2:P0}" Name="Label0" Position="62.5, 125" Size="100, 30" 
                                                        Text="" TextOrientation="BottomToTop" />
                                                </labels>
                                            </dx:LinearScaleComponent>
                                        </scales>
                                        <backgroundlayers>
                                            <dx:LinearScaleBackgroundLayerComponent AcceptOrder="-1000" LinearScale="" 
                                                Name="bg1" ScaleEndPos="0.5, 0.1" ScaleID="scale1" ScaleStartPos="0.5, 0.9" 
                                                ShapeType="Linear_Style10" ZOrder="1000" />
                                        </backgroundlayers>
                                        <indicators>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-100" Center="62.5, 225" 
                                                IndicatorScale="" Name="Indicator0" ScaleID="scale1" Size="58.5702, 18.94918" 
                                                StateIndex="0" ZOrder="100">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="100" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="0.01" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="0" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-99" 
                                                Center="62.5, 202.7778" IndicatorScale="" Name="Indicator1" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="99">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="90" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="10" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="10" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-98" 
                                                Center="62.5, 180.5556" IndicatorScale="" Name="Indicator2" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="98">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="80" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="20" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="20" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-97" 
                                                Center="62.5, 158.3333" IndicatorScale="" Name="Indicator3" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="97">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="70" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="30" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="30" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-96" 
                                                Center="62.5, 136.1111" IndicatorScale="" Name="Indicator4" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="96">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="60" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="40" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="40" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-95" 
                                                Center="62.5, 113.8889" IndicatorScale="" Name="Indicator5" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="95">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="50" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="50" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="50" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-94" 
                                                Center="62.5, 91.66667" IndicatorScale="" Name="Indicator6" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="94">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="40" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="60" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="60" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-93" 
                                                Center="62.5, 69.44444" IndicatorScale="" Name="Indicator7" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="93">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="30" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="70" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="70" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-92" 
                                                Center="62.5, 47.22222" IndicatorScale="" Name="Indicator8" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="92">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="20" Name="Colored" 
                                                        ShapeType="Equalizer2" StartValue="80" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="80" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-91" Center="62.5, 25" 
                                                IndicatorScale="" Name="Indicator9" ScaleID="scale1" Size="58.5702, 18.94918" 
                                                StateIndex="1" ZOrder="91">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="10" Name="Colored" 
                                                        ShapeType="Equalizer2" StartValue="90" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="90" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                        </indicators>
                                    </dx:LinearGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            <br />
                            Загрузка по току<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl29" 
                                runat="server" BackColor="White" Height="50px" Value="1" Width="140px">
                                <Gauges>
                                    <dx:LinearGauge Bounds="0, 0, 140, 50" Name="Level_Bars" 
                                        Orientation="Horizontal">
                                        <scales>
                                            <dx:LinearScaleComponent AcceptOrder="0" 
                                                AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                CustomLogarithmicBase="2" EndPoint="62.5, 225" MajorTickCount="2" 
                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-20" 
                                                MajorTickmark-ShapeType="Linear_Style1_1" MajorTickmark-ShowText="False" 
                                                MajorTickmark-ShowTick="False" MajorTickmark-TextOffset="-32" MaxValue="100" 
                                                MinorTickCount="0" MinorTickmark-ShapeOffset="-14" 
                                                MinorTickmark-ShapeType="Linear_Style1_2" MinorTickmark-ShowTick="False" 
                                                Name="scale1" StartPoint="62.5, 25" Value="1">
                                                <labels>
                                                    <dx:ScaleLabelWeb AppearanceText-Font="Tahoma, 16pt, style=Bold" 
                                                        FormatString="{0} {2:P0}" Name="Label0" Position="62.5, 125" Size="100, 30" 
                                                        Text="" TextOrientation="BottomToTop" />
                                                </labels>
                                            </dx:LinearScaleComponent>
                                        </scales>
                                        <backgroundlayers>
                                            <dx:LinearScaleBackgroundLayerComponent AcceptOrder="-1000" LinearScale="" 
                                                Name="bg1" ScaleEndPos="0.5, 0.1" ScaleID="scale1" ScaleStartPos="0.5, 0.9" 
                                                ShapeType="Linear_Style10" ZOrder="1000" />
                                        </backgroundlayers>
                                        <indicators>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-100" Center="62.5, 225" 
                                                IndicatorScale="" Name="Indicator0" ScaleID="scale1" Size="58.5702, 18.94918" 
                                                StateIndex="0" ZOrder="100">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="100" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="0.01" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="0" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-99" 
                                                Center="62.5, 202.7778" IndicatorScale="" Name="Indicator1" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="99">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="90" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="10" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="10" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-98" 
                                                Center="62.5, 180.5556" IndicatorScale="" Name="Indicator2" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="98">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="80" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="20" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="20" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-97" 
                                                Center="62.5, 158.3333" IndicatorScale="" Name="Indicator3" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="97">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="70" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="30" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="30" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-96" 
                                                Center="62.5, 136.1111" IndicatorScale="" Name="Indicator4" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="96">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="60" Name="Colored" 
                                                        ShapeType="Equalizer4" StartValue="40" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="40" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-95" 
                                                Center="62.5, 113.8889" IndicatorScale="" Name="Indicator5" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="95">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="50" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="50" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="50" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-94" 
                                                Center="62.5, 91.66667" IndicatorScale="" Name="Indicator6" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="94">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="40" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="60" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="60" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-93" 
                                                Center="62.5, 69.44444" IndicatorScale="" Name="Indicator7" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="93">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="30" Name="Colored" 
                                                        ShapeType="Equalizer3" StartValue="70" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="70" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-92" 
                                                Center="62.5, 47.22222" IndicatorScale="" Name="Indicator8" ScaleID="scale1" 
                                                Size="58.5702, 18.94918" StateIndex="1" ZOrder="92">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="20" Name="Colored" 
                                                        ShapeType="Equalizer2" StartValue="80" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="80" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                            <dx:LinearScaleStateIndicatorComponent AcceptOrder="-91" Center="62.5, 25" 
                                                IndicatorScale="" Name="Indicator9" ScaleID="scale1" Size="58.5702, 18.94918" 
                                                StateIndex="1" ZOrder="91">
                                                <states>
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="10" Name="Colored" 
                                                        ShapeType="Equalizer2" StartValue="90" />
                                                    <dx:ScaleIndicatorStateWeb IntervalLength="90" Name="Empty" 
                                                        ShapeType="ProgressItem0" />
                                                </states>
                                            </dx:LinearScaleStateIndicatorComponent>
                                        </indicators>
                                    </dx:LinearGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            <br />
                        </td>
                        <td>
                        
                            Входное сопр. трубопровода, Ом<br /><dx:ASPxGaugeControl 
                                ID="ASPxGaugeControl22" runat="server" BackColor="White" Height="30px" 
                                Value="0,17" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="0,17">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            <br />
                            Сопр. цепи СКЗ, Ом<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl23" 
                                runat="server" BackColor="White" Height="30px" Value="6,51" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="6,51">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                            <br />
                            Сопр. анодного заземления, Ом<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl24" 
                                runat="server" BackColor="White" Height="30px" Value="6,33" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="6,33">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />

<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                            </dx:ASPxGaugeControl>
                        
                        </td>
                        </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Управление">
                <TabImage IconID="chart_openhighlowclosecandlestick_16x16">
                </TabImage>
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxPageControl ID="ASPxPageControl4" runat="server" ActiveTabIndex="0" 
                            Theme="Youthful">
                            <TabPages>
                                <dx:TabPage Text="Канал 1">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxNavBar ID="ASPxNavBarControl0" runat="server" EnableTheming="True" 
                                                Theme="Youthful" Width="100%">
                                                <Groups>
                                                    <dx:NavBarGroup Name="Суммарный потенциал" Text="Суммарный потенциал">
                                                        <ItemImage IconID="scheduling_cellsautoheight_16x16">
                                                        </ItemImage>
                                                        <ContentTemplate>
                                                            Новое значение суммарного потенциала, мВ<dx:ASPxTrackBar ID="ASPxTrackBar2" 
                                                                runat="server" Direction="Reversed" EnableTheming="True" 
                                                                LargeTickEndValue="-2500" LargeTickInterval="500" MaxValue="0" MinValue="-2500" 
                                                                Position="0" PositionStart="0" ScaleLabelHighlightMode="AlongBarHighlight" 
                                                                ScalePosition="Both" SmallTickFrequency="500" Step="50" Theme="Youthful" 
                                                                Width="300px">
                                                            </dx:ASPxTrackBar>
                                                            <dx:ASPxButton ID="ASPxButton4" runat="server" Text="Выдать">
                                                            </dx:ASPxButton>
                                                            <br />
                                                            <br />
                                                        </ContentTemplate>
                                                    </dx:NavBarGroup>
                                                    <dx:NavBarGroup Expanded="False" Name="Поляризационный потенциал" 
                                                        Text="Поляризационный потенциал">
                                                        <ItemImage IconID="scheduling_cellsautoheight_16x16">
                                                        </ItemImage>
                                                        <ContentTemplate>
                                                            Новое значение поляризационного потенциала, мВ<dx:ASPxTrackBar 
                                                                ID="ASPxTrackBar3" runat="server" Direction="Reversed" EnableTheming="True" 
                                                                LargeTickEndValue="-2500" LargeTickInterval="500" MaxValue="0" MinValue="-2500" 
                                                                Position="0" PositionStart="0" ScaleLabelHighlightMode="AlongBarHighlight" 
                                                                ScalePosition="Both" SmallTickFrequency="500" Step="50" Theme="Youthful" 
                                                                Width="300px">
                                                            </dx:ASPxTrackBar>
                                                            <dx:ASPxButton ID="ASPxButton5" runat="server" Text="Выдать">
                                                            </dx:ASPxButton>
                                                            <br />
                                                            <br />
                                                        </ContentTemplate>
                                                    </dx:NavBarGroup>
                                                    <dx:NavBarGroup Expanded="False" Name="Ток" Text="Ток">
                                                        <ItemImage IconID="chart_rangearea_16x16">
                                                        </ItemImage>
                                                        <ContentTemplate>
                                                            Новое значение тока, А<dx:ASPxTrackBar ID="ASPxTrackBar4" runat="server" 
                                                                EnableTheming="True" LargeTickInterval="10" Position="0" PositionStart="0" 
                                                                ScaleLabelHighlightMode="AlongBarHighlight" ScalePosition="Both" Step="1" 
                                                                Theme="Youthful" Width="300px">
                                                            </dx:ASPxTrackBar>
                                                            <dx:ASPxButton ID="ASPxButton6" runat="server" Text="Выдать">
                                                            </dx:ASPxButton>
                                                            <br />
                                                            <br />
                                                        </ContentTemplate>
                                                    </dx:NavBarGroup>
                                                    <dx:NavBarGroup Expanded="False" Name="Напряжение" Text="Напряжение">
                                                        <ItemImage IconID="chart_stepline_16x16">
                                                        </ItemImage>
                                                        <ContentTemplate>
                                                            Новое значение напряжения, В<dx:ASPxTrackBar ID="ASPxTrackBar5" runat="server" 
                                                                EnableTheming="True" LargeTickInterval="10" Position="0" PositionStart="0" 
                                                                ScaleLabelHighlightMode="AlongBarHighlight" ScalePosition="Both" Step="1" 
                                                                Theme="Youthful" Width="300px">
                                                            </dx:ASPxTrackBar>
                                                            <dx:ASPxButton ID="ASPxButton7" runat="server" Text="Выдать">
                                                            </dx:ASPxButton>
                                                            <br />
                                                            <br />
                                                        </ContentTemplate>
                                                    </dx:NavBarGroup>
                                                    <dx:NavBarGroup Expanded="False" Name="Выключение" Text="Выключение">
                                                        <ItemImage IconID="programming_forcetesting_16x16">
                                                        </ItemImage>
                                                        <ContentTemplate>
                                                            <dx:ASPxButton ID="ASPxButton8" runat="server" Text="Выключить">
                                                            </dx:ASPxButton>
                                                            <br />
                                                        </ContentTemplate>
                                                    </dx:NavBarGroup>
                                                </Groups>
                                            </dx:ASPxNavBar>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 2">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 3">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 4">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 5">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="Канал 6">
                                    <TabImage IconID="gauges_gaugestylehalfcircular_16x16">
                                    </TabImage>
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>

                        <br />
                        <br />
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Режим прерывания">
                <TabImage IconID="programming_forcetesting_16x16">
                </TabImage>
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
                            <Items>
                                <dx:LayoutGroup Caption="ВЫКЛЮЧЕНИЕ" GroupBoxDecoration="HeadingLine">
                                    <Items>
                                        <dx:LayoutItem Caption="Время отключения">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E2" runat="server" EditFormat="DateTime" 
                                                        EditFormatString="dd.mm.yyyy hh:mm:ss">
                                                        <TimeSectionProperties Visible="True">
                                                        </TimeSectionProperties>
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Время включения">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E3" runat="server" EditFormat="DateTime" 
                                                        EditFormatString="dd.mm.yyyy hh:mm:ss">
                                                        <TimeSectionProperties Visible="True">
                                                        </TimeSectionProperties>
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxButton ID="ASPxFormLayout1_E1" runat="server" Text="Выдать">
                                                    </dx:ASPxButton>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                                <dx:LayoutGroup Caption="ПРЕРЫВАНИЕ" GroupBoxDecoration="HeadingLine">
                                    <Items>
                                        <dx:LayoutItem Caption="Время начала">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E4" runat="server" EditFormat="DateTime" 
                                                        EditFormatString="dd.mm.yyyy hh:mm:ss">
                                                        <TimeSectionProperties Visible="True">
                                                        </TimeSectionProperties>
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Время окончания">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxDateEdit ID="ASPxFormLayout1_E5" runat="server" EditFormat="DateTime" 
                                                        EditFormatString="dd.mm.yyyy hh:mm:ss">
                                                        <TimeSectionProperties Visible="True">
                                                        </TimeSectionProperties>
                                                    </dx:ASPxDateEdit>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Время во включенном состоянии, с">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E6" runat="server" Width="170px">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Время в выключенном состоянии, с">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxTextBox ID="ASPxFormLayout1_E7" runat="server" Width="170px">
                                                    </dx:ASPxTextBox>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxButton ID="ASPxFormLayout1_E8" runat="server" Text="Выдать">
                                                    </dx:ASPxButton>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                </dx:LayoutGroup>
                            </Items>
                        </dx:ASPxFormLayout>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Архив за сутки">
                <TabImage IconID="chart_previewchart_16x16">
                </TabImage>
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
    <br />
    <dx:ASPxPageControl ID="ASPxPageControl5" runat="server" ActiveTabIndex="0" 
        Theme="Youthful" Width="100%" Visible="False">
        <TabPages>
            <dx:TabPage Text="Мониторинг">
                <TabImage IconID="chart_fullstackedline_16x16">
                </TabImage>
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <table>
                        <tr>
                        <td>
                            Последние данные<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl51" 
                                runat="server" BackColor="White" Height="40px" Value="06.04.2017 19:58:17" 
                                Width="180px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 180, 40" DigitCount="15" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="06.04.2017 19:58:17">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="739.437561, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                            </dx:ASPxGaugeControl>
                            <br />
                            Параметры БКМУ<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl36" runat="server" 
                                BackColor="White" Height="140px" LayoutInterval="6" Value="1" Width="140px">
                                <Gauges>
                                    <dx:CircularGauge Bounds="6, 6, 128, 128" Name="circularGauge10">
                                        <scales>
                                            <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 9pt" 
                                                Center="125, 170" EndAngle="0" MajorTickCount="6" 
                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-6" 
                                                MajorTickmark-ShapeType="Circular_Style25_1" MajorTickmark-TextOffset="-20" 
                                                MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" 
                                                MinorTickmark-ShapeOffset="-2" MinorTickmark-ShapeType="Circular_Style25_2" 
                                                Name="scale1" RadiusX="95" RadiusY="95" StartAngle="-180" Value="1">
                                                <ranges>
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#9EC968&quot;/&gt;" 
                                                        EndThickness="2" EndValue="33" Name="Range0" ShapeOffset="11.5" 
                                                        StartThickness="2" />
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFDA80&quot;/&gt;" 
                                                        EndThickness="2" EndValue="66" Name="Range1" ShapeOffset="11.5" 
                                                        StartThickness="2" StartValue="33" />
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E99D9D&quot;/&gt;" 
                                                        EndThickness="2" EndValue="100" Name="Range2" ShapeOffset="11.5" 
                                                        StartThickness="2" StartValue="66" />
                                                </ranges>
                                            </dx:ArcScaleComponent>
                                        </scales>
                                        <backgroundlayers>
                                            <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" 
                                                ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style25" 
                                                Size="200, 145" ZOrder="1000" />
                                        </backgroundlayers>
                                        <needles>
                                            <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="13" 
                                                Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style25" 
                                                StartOffset="-16.5" ZOrder="-50" />
                                        </needles>
                                        <markers>
                                            <dx:ArcScaleMarkerComponent AcceptOrder="100" ArcScale="" 
                                                Name="circularGauge10_Marker1" ScaleID="scale1" ZOrder="-100" />
                                        </markers>
                                        <spindlecaps>
                                            <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                                                Name="circularGauge10_SpindleCap1" ScaleID="scale1" 
                                                ShapeType="CircularFull_Style25" Size="15, 15" ZOrder="-100" />
                                        </spindlecaps>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" Name="circularGauge10_Label1" 
                                                Text="Ток, А" ZOrder="-1001" />
                                        </labels>
                                    </dx:CircularGauge>
                                </Gauges>
                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                            </dx:ASPxGaugeControl>
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl37" runat="server" BackColor="White" 
                                Height="140px" LayoutInterval="6" Value="1" Width="140px">
                                <Gauges>
                                    <dx:CircularGauge Bounds="6, 6, 128, 128" Name="circularGauge10">
                                        <scales>
                                            <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 9pt" 
                                                Center="125, 170" EndAngle="0" MajorTickCount="6" 
                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-6" 
                                                MajorTickmark-ShapeType="Circular_Style25_1" MajorTickmark-TextOffset="-20" 
                                                MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" 
                                                MinorTickmark-ShapeOffset="-2" MinorTickmark-ShapeType="Circular_Style25_2" 
                                                Name="scale1" RadiusX="95" RadiusY="95" StartAngle="-180" Value="1">
                                                <ranges>
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#9EC968&quot;/&gt;" 
                                                        EndThickness="2" EndValue="33" Name="Range0" ShapeOffset="11.5" 
                                                        StartThickness="2" />
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFDA80&quot;/&gt;" 
                                                        EndThickness="2" EndValue="66" Name="Range1" ShapeOffset="11.5" 
                                                        StartThickness="2" StartValue="33" />
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E99D9D&quot;/&gt;" 
                                                        EndThickness="2" EndValue="100" Name="Range2" ShapeOffset="11.5" 
                                                        StartThickness="2" StartValue="66" />
                                                </ranges>
                                            </dx:ArcScaleComponent>
                                        </scales>
                                        <backgroundlayers>
                                            <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" 
                                                ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style25" 
                                                Size="200, 145" ZOrder="1000" />
                                        </backgroundlayers>
                                        <needles>
                                            <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="13" 
                                                Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style25" 
                                                StartOffset="-16.5" ZOrder="-50" />
                                        </needles>
                                        <markers>
                                            <dx:ArcScaleMarkerComponent AcceptOrder="100" ArcScale="" 
                                                Name="circularGauge10_Marker1" ScaleID="scale1" ZOrder="-100" />
                                        </markers>
                                        <spindlecaps>
                                            <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                                                Name="circularGauge10_SpindleCap1" ScaleID="scale1" 
                                                ShapeType="CircularFull_Style25" Size="15, 15" ZOrder="-100" />
                                        </spindlecaps>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" Name="circularGauge10_Label1" 
                                                Text="Напряжение, В" ZOrder="-1001" />
                                        </labels>
                                    </dx:CircularGauge>
                                </Gauges>
                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                            </dx:ASPxGaugeControl>
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl38" runat="server" BackColor="White" 
                                Height="140px" LayoutInterval="6" Value="0" Width="70px">
                                <Gauges>
                                    <dx:LinearGauge Bounds="6, 6, 58, 128" Name="linearGauge9">
                                        <scales>
                                            <dx:LinearScaleComponent AcceptOrder="0" 
                                                AppearanceTickmarkText-Font="Tahoma, 8pt" CustomLogarithmicBase="2" 
                                                EndPoint="62.5, 38" MajorTickCount="6" MajorTickmark-FormatString="{0:F0}" 
                                                MajorTickmark-ShapeOffset="-25" MajorTickmark-ShapeType="Linear_Style25_1" 
                                                MajorTickmark-TextOffset="-35" MaxValue="0" MinorTickCount="4" 
                                                MinorTickmark-ShapeOffset="-22" MinorTickmark-ShapeType="Linear_Style25_2" 
                                                MinValue="-3000" Name="scale1" StartPoint="62.5, 212">
                                                <ranges>
                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1D183&quot;/&gt;" 
                                                        EndThickness="3" EndValue="-1000" Name="Range0" ShapeOffset="-12" 
                                                        StartThickness="3" />
                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1877E&quot;/&gt;" 
                                                        EndThickness="3" EndValue="-3000" Name="Range1" ShapeOffset="-12" 
                                                        StartThickness="3" StartValue="-2500" />
                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#7AC463&quot;/&gt;" 
                                                        EndThickness="3" EndValue="-2500" Name="Range2" ShapeOffset="-12" 
                                                        StartThickness="3" StartValue="-1000" />
                                                </ranges>
                                            </dx:LinearScaleComponent>
                                        </scales>
                                        <levels>
                                            <dx:LinearScaleLevelComponent AcceptOrder="50" LinearScale="" Name="level1" 
                                                ScaleID="scale1" ShapeType="Style25" ZOrder="-50" />
                                        </levels>
                                        <backgroundlayers>
                                            <dx:LinearScaleBackgroundLayerComponent AcceptOrder="-1000" LinearScale="" 
                                                Name="bg1" ScaleID="scale1" ScaleStartPos="0.5, 0.85" 
                                                ShapeType="Linear_Style25" ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Tahoma, 12pt" 
                                                Name="linearGauge9_Label1" Position="93.1, 116.7" 
                                                Text="Суммарный потенциал, мВ" TextOrientation="BottomToTop" ZOrder="-1001" />
                                        </labels>
                                    </dx:LinearGauge>
                                </Gauges>
                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                            </dx:ASPxGaugeControl>
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl39" runat="server" BackColor="White" 
                                Height="140px" LayoutInterval="6" Value="0" Width="70px">
                                <Gauges>
                                    <dx:LinearGauge Bounds="6, 6, 58, 128" Name="linearGauge9">
                                        <scales>
                                            <dx:LinearScaleComponent AcceptOrder="0" 
                                                AppearanceTickmarkText-Font="Tahoma, 8pt" CustomLogarithmicBase="2" 
                                                EndPoint="62.5, 38" MajorTickCount="6" MajorTickmark-FormatString="{0:F0}" 
                                                MajorTickmark-ShapeOffset="-25" MajorTickmark-ShapeType="Linear_Style25_1" 
                                                MajorTickmark-TextOffset="-35" MaxValue="0" MinorTickCount="4" 
                                                MinorTickmark-ShapeOffset="-22" MinorTickmark-ShapeType="Linear_Style25_2" 
                                                MinValue="-3000" Name="scale1" StartPoint="62.5, 212">
                                                <ranges>
                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1D183&quot;/&gt;" 
                                                        EndThickness="3" EndValue="-850" Name="Range0" ShapeOffset="-12" 
                                                        StartThickness="3" />
                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#F1877E&quot;/&gt;" 
                                                        EndThickness="3" EndValue="-3000" Name="Range1" ShapeOffset="-12" 
                                                        StartThickness="3" StartValue="-1150" />
                                                    <dx:LinearScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#7AC463&quot;/&gt;" 
                                                        EndThickness="3" EndValue="-1150" Name="Range2" ShapeOffset="-12" 
                                                        StartThickness="3" StartValue="-850" />
                                                </ranges>
                                            </dx:LinearScaleComponent>
                                        </scales>
                                        <levels>
                                            <dx:LinearScaleLevelComponent AcceptOrder="50" LinearScale="" Name="level1" 
                                                ScaleID="scale1" ShapeType="Style25" ZOrder="-50" />
                                        </levels>
                                        <backgroundlayers>
                                            <dx:LinearScaleBackgroundLayerComponent AcceptOrder="-1000" LinearScale="" 
                                                Name="bg1" ScaleID="scale1" ScaleStartPos="0.5, 0.85" 
                                                ShapeType="Linear_Style25" ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" AppearanceText-Font="Tahoma, 12pt" 
                                                Name="linearGauge9_Label1" Position="93.1, 116.7" 
                                                Text="Поляризационный потенциал, мВ" TextOrientation="BottomToTop" 
                                                ZOrder="-1001" />
                                        </labels>
                                    </dx:LinearGauge>
                                </Gauges>
                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                            </dx:ASPxGaugeControl>
                            <br />
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl40" runat="server" BackColor="White" 
                                Height="30px" Value="07,500" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="07,500">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                            </dx:ASPxGaugeControl>
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl41" runat="server" BackColor="White" 
                                Height="30px" Value="48,800" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="48,800">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                            </dx:ASPxGaugeControl>
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl42" runat="server" BackColor="White" 
                                Height="30px" Value="-1200" Width="70px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 70, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="-1200">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                            </dx:ASPxGaugeControl>
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl43" runat="server" BackColor="White" 
                                Height="30px" Value="-900" Width="70px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 70, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="-900">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                            </dx:ASPxGaugeControl>
                            <br />
                            Температура, С<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl44" runat="server" 
                                BackColor="White" Height="30px" Value="+33,5" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="+33,5">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                            </dx:ASPxGaugeControl>
                        </td>
                        <td>
                            Параметры БСЗ<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl45" runat="server" 
                                BackColor="White" Height="140px" LayoutInterval="6" Value="1" Width="140px">
                                <Gauges>
                                    <dx:CircularGauge Bounds="6, 6, 128, 128" Name="circularGauge10">
                                        <scales>
                                            <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 9pt" 
                                                Center="125, 170" EndAngle="0" MajorTickCount="6" 
                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-6" 
                                                MajorTickmark-ShapeType="Circular_Style25_1" MajorTickmark-TextOffset="-20" 
                                                MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" 
                                                MinorTickmark-ShapeOffset="-2" MinorTickmark-ShapeType="Circular_Style25_2" 
                                                Name="scale1" RadiusX="95" RadiusY="95" StartAngle="-180" Value="1">
                                                <ranges>
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#9EC968&quot;/&gt;" 
                                                        EndThickness="2" EndValue="33" Name="Range0" ShapeOffset="11.5" 
                                                        StartThickness="2" />
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFDA80&quot;/&gt;" 
                                                        EndThickness="2" EndValue="66" Name="Range1" ShapeOffset="11.5" 
                                                        StartThickness="2" StartValue="33" />
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E99D9D&quot;/&gt;" 
                                                        EndThickness="2" EndValue="100" Name="Range2" ShapeOffset="11.5" 
                                                        StartThickness="2" StartValue="66" />
                                                </ranges>
                                            </dx:ArcScaleComponent>
                                        </scales>
                                        <backgroundlayers>
                                            <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" 
                                                ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style25" 
                                                Size="200, 145" ZOrder="1000" />
                                        </backgroundlayers>
                                        <needles>
                                            <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="13" 
                                                Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style25" 
                                                StartOffset="-16.5" ZOrder="-50" />
                                        </needles>
                                        <markers>
                                            <dx:ArcScaleMarkerComponent AcceptOrder="100" ArcScale="" 
                                                Name="circularGauge10_Marker1" ScaleID="scale1" ZOrder="-100" />
                                        </markers>
                                        <spindlecaps>
                                            <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                                                Name="circularGauge10_SpindleCap1" ScaleID="scale1" 
                                                ShapeType="CircularFull_Style25" Size="15, 15" ZOrder="-100" />
                                        </spindlecaps>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" Name="circularGauge10_Label1" 
                                                Text="Ток, А" ZOrder="-1001" />
                                        </labels>
                                    </dx:CircularGauge>
                                </Gauges>
                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                            </dx:ASPxGaugeControl>
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl46" runat="server" BackColor="White" 
                                Height="140px" LayoutInterval="6" Value="1" Width="140px">
                                <Gauges>
                                    <dx:CircularGauge Bounds="6, 6, 128, 128" Name="circularGauge10">
                                        <scales>
                                            <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 9pt" 
                                                Center="125, 170" EndAngle="0" MajorTickCount="6" 
                                                MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-6" 
                                                MajorTickmark-ShapeType="Circular_Style25_1" MajorTickmark-TextOffset="-20" 
                                                MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" 
                                                MinorTickmark-ShapeOffset="-2" MinorTickmark-ShapeType="Circular_Style25_2" 
                                                Name="scale1" RadiusX="95" RadiusY="95" StartAngle="-180" Value="1">
                                                <ranges>
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#9EC968&quot;/&gt;" 
                                                        EndThickness="2" EndValue="33" Name="Range0" ShapeOffset="11.5" 
                                                        StartThickness="2" />
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#FFDA80&quot;/&gt;" 
                                                        EndThickness="2" EndValue="66" Name="Range1" ShapeOffset="11.5" 
                                                        StartThickness="2" StartValue="33" />
                                                    <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#E99D9D&quot;/&gt;" 
                                                        EndThickness="2" EndValue="100" Name="Range2" ShapeOffset="11.5" 
                                                        StartThickness="2" StartValue="66" />
                                                </ranges>
                                            </dx:ArcScaleComponent>
                                        </scales>
                                        <backgroundlayers>
                                            <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" 
                                                ScaleCenterPos="0.5, 0.695" ScaleID="scale1" ShapeType="CircularHalf_Style25" 
                                                Size="200, 145" ZOrder="1000" />
                                        </backgroundlayers>
                                        <needles>
                                            <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="13" 
                                                Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style25" 
                                                StartOffset="-16.5" ZOrder="-50" />
                                        </needles>
                                        <markers>
                                            <dx:ArcScaleMarkerComponent AcceptOrder="100" ArcScale="" 
                                                Name="circularGauge10_Marker1" ScaleID="scale1" ZOrder="-100" />
                                        </markers>
                                        <spindlecaps>
                                            <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                                                Name="circularGauge10_SpindleCap1" ScaleID="scale1" 
                                                ShapeType="CircularFull_Style25" Size="15, 15" ZOrder="-100" />
                                        </spindlecaps>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" Name="circularGauge10_Label1" 
                                                Text="Напряжение, В" ZOrder="-1001" />
                                        </labels>
                                    </dx:CircularGauge>
                                </Gauges>
                                <LayoutPadding All="6" Bottom="6" Left="6" Right="6" Top="6" />
                            </dx:ASPxGaugeControl>
                            <br />
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl47" runat="server" BackColor="White" 
                                Height="30px" Value="07,500" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="07,500">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                            </dx:ASPxGaugeControl>
                            <dx:ASPxGaugeControl ID="ASPxGaugeControl48" runat="server" BackColor="White" 
                                Height="30px" Value="48,800" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="48,800">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                            </dx:ASPxGaugeControl>
                            <br />
                            Уставка по току<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl49" 
                                runat="server" BackColor="White" Height="30px" Value="07,500" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="07,500">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                            </dx:ASPxGaugeControl>
                            <br />
                            Уставка по напряжению<br /><dx:ASPxGaugeControl ID="ASPxGaugeControl50" 
                                runat="server" BackColor="White" Height="30px" Value="48,800" Width="140px">
                                <Gauges>
                                    <dx:DigitalGauge AppearanceOff-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#0FD4F2FF&quot;/&gt;" 
                                        AppearanceOn-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#D4F2FF&quot;/&gt;" 
                                        Bounds="0, 0, 140, 30" DigitCount="5" Name="dGauge1" Padding="20, 20, 20, 20" 
                                        Text="48,800">
                                        <backgroundlayers>
                                            <dx:DigitalBackgroundLayerComponent AcceptOrder="-1000" 
                                                BottomRight="259.8125, 99.9625" Name="b1" ShapeType="Style2" TopLeft="20, 0" 
                                                ZOrder="1000" />
                                        </backgroundlayers>
                                        <labels>
                                            <dx:LabelComponent AcceptOrder="1001" 
                                                AppearanceText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Black&quot;/&gt;" 
                                                Name="dGauge1_Label1" Position="139.9, -34" Text="Ток" ZOrder="-1001" />
                                        </labels>
                                    </dx:DigitalGauge>
                                </Gauges>
                                <LayoutPadding All="0" Bottom="0" Left="0" Right="0" Top="0" />
                            </dx:ASPxGaugeControl>
                        </td>
                        </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Управление">
                <TabImage IconID="chart_openhighlowclosecandlestick_16x16">
                </TabImage>
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>

</asp:Content>
