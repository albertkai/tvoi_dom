Template.search.rendered = ->

  @map = null
  Deps.autorun ->
    lat = Session.get('searchLat')
    lng = Session.get('searchLng')
    if lat and lng
      'Deps worked'
      GoogleMaps.init {}, ->
        mapOptions = {
          zoom:14,
          zoomControl:true,
          zoomControlOpt:{
            style:"MEDIUM",
            position:"RIGHT_BOTTOM"
          },
          panControl:false,
          streetViewControl:false,
          mapTypeControl:false,
          overviewMapControl:false,
          scrollwheel:false
        }
        map = new google.maps.Map(document.getElementById("search-map"), mapOptions)
        map.setCenter(new google.maps.LatLng( lat, lng ))
        markerPos = new google.maps.LatLng(lat, lng)
        marker = new google.maps.Marker({
          position: markerPos,
          map: map,
          title:"Тсж №135"
        })


        searchStyler = [
          {
            "featureType": "landscape.man_made",
            "stylers": [
              { "invert_lightness": true },
              { "color": "#c7ffcc" },
              { "saturation": 61 },
              { "lightness": 1 },
              { "gamma": 1.4 }
            ]
          },{
            "featureType": "water",
            "stylers": [
              { "color": "#77b4f2" },
              { "lightness": 49 }
            ]
          }
        ]
        styledMap = new google.maps.StyledMapType(searchStyler, {name: "Styled Map"})

        map.mapTypes.set('map_style', styledMap)

        map.setMapTypeId('map_style')

  Session.set 'searchLat', 59.9386300
  Session.set 'searchLng', 30.3141300


Template.search.helpers {

  'result': ->

    Session.get 'searchResult'

  'getPhones': (phone)->
    str = ''
    phone.forEach (p)->
      str += p + ', '
    str.substr(0, str.length - 2)

}


Template.search.events {

  'click #search': ->

    city = $('#city-input').val()
    street = $('#street-input').val().toLowerCase()
    house = $('#house-input').val()
    corpus = do ->
      corpusData = $('#corpus-input').val()
      if corpusData isnt ''
        corpusData
      else
        null

    Meteor.setTimeout ->
      $.scrollTo '.search-string', 600
    , 400

    company = Companies.findOne({houses: {$elemMatch: {city: city, street: street, house: house, corpus: corpus}}})
    if company
      Session.set 'searchLat', company.coords[0]
      Session.set 'searchLng', company.coords[1]
      Session.set 'searchResult', company



}


