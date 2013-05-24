initialize = ->

  mapOptions =
    zoom: 3
    center: new google.maps.LatLng(46, 2)
    mapTypeId: google.maps.MapTypeId.ROADMAP

  markers = [
      new google.maps.LatLng(59.32522, 18.07002),
      new google.maps.LatLng(19.20, 75.42),
      new google.maps.LatLng(19.25, 75.42)
    ]

  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

  addMarker = (marker) ->
    markerOnMap = new google.maps.Marker(
      map: map
      draggable: false
      animation: google.maps.Animation.DROP
      position: marker
    )

  generateLocations = (data) ->
    $.each data, (i, item) ->
      markers.push(new google.maps.LatLng(item.latitude, item.longtitude))

  getMarkers = ->
    t = undefined
    $.getJSON('/leads', (data) =>
      generateLocations(data)
      if markers.length > 0
        clearTimeout(t)
        drop()
      else
        t = setTimeout getMarkers, 500
    )

  drop = ->
    marker = markers.shift()
    t = undefined
    console.log(marker)
    if marker
      addMarker marker
      t = setTimeout drop, 500
    else
      clearTimeout(t)
      getMarkers()

  drop()

window.onload = initialize
