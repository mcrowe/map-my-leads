initialize = ->

  mapOptions =
    zoom: 3
    center: new google.maps.LatLng(14.81, 5.50)
    mapTypeId: google.maps.MapTypeId.ROADMAP

  accountId = $('#map-canvas').data('account_id')

  markers = []
  timeStamp = new Date().toString()
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

  addMarker = (marker) ->
    markerOnMap = new google.maps.Marker(
      map: map
      draggable: false
      animation: google.maps.Animation.DROP
      position: marker
    )

  generateLocations = (data) ->
    timeStamp = data[data.length - 1].createdAt if data.length > 0
    $.each data, (i, item) ->
      markers.push(new google.maps.LatLng(item.latitude, item.longitude))

  getMarkers = ->
    t = undefined
    url = '/account/' + accountId + '/leads?from=' + encodeURIComponent(timeStamp)
    console.log(url)
    $.getJSON(url, (data) =>
      generateLocations(data)
      if markers.length > 0
        clearTimeout(t)
        drop()
      else
        t = setTimeout getMarkers, 2000
    )

  drop = ->
    marker = markers.shift()
    t = undefined
    if marker
      addMarker marker
      t = setTimeout drop, 500
    else
      clearTimeout(t)
      getMarkers()

  drop()

window.onload = initialize
