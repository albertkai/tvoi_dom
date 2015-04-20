Template.company.rendered = ->

  CompanyCtrl.tabs.init()
#  Deps.autorun ->
#    lat = Session.get('lat')
#    lng = Session.get('lng')
#    if lat and lng
#      'Deps worked'
#      GoogleMaps.init {}, ->
#        mapOptions = {
#          zoom:15,
#          zoomControl:true,
#          zoomControlOpt:{
#            style:"MEDIUM",
#            position:"RIGHT_BOTTOM"
#          },
#          panControl:false,
#          streetViewControl:false,
#          mapTypeControl:false,
#          overviewMapControl:false,
#          scrollwheel:false
#        }
#        map = new google.maps.Map(document.getElementById("map"), mapOptions)
#        map.setCenter(new google.maps.LatLng( lat, lng ))
#        markerPos = new google.maps.LatLng(lat, lng)
#        marker = new google.maps.Marker({
#          position: markerPos,
#          map: map,
#          title:"Тсж №135"
#        })

Template.company.helpers {

  'getPhones': (phone)->
    str = ''
    phone.forEach (p)->
      str += p + ', '
    str.substr(0, str.length - 2)

#  'drawMap': (coords)->
#    if coords
#      Session.set('lat', coords[0])
#      Session.set('lng', coords[1])
#      log 'draw map'

}

Template.company.events {

  'click #tab-nav li': (e)->

    index = $(e.currentTarget).index()
    $('#tab-nav li').removeClass '_active'
    $(e.currentTarget).addClass '_active'
    CompanyCtrl.tabs.goTo(index)

}

@CompanyCtrl = {

  tabs: {

    init: ->

      #Initializing elements
      log 'initializing tabs'
      @cont = $('.info-tabs')
      @wrap = @cont.find('.info-tabs-cont')
      @tab = @cont.find('.info-cont')

      @tab.first().addClass '_active'

      @setSizes()
      @handleResize()

    handleResize: ->

      $(window).resize =>

        debouncedFunc = _.debounce =>
          @setSizes()
        , 500

        debouncedFunc()

    setSizes: ->

      log 'Set sizes'
      width = $(window).width()
      @wrap.css('width', width * 3 + 10 + 'px')
      @tab.css('width', width + 'px')

      left = @wrap.find('.info-cont._active').index() * $(window).width() * -1
      @wrap.css('left', left + 'px')

    goTo: (index)->

      width = $(window).width()
      contWidth = width * index * -1
      @wrap.css('left', contWidth + 'px')

      @tab.removeClass '_active'
      @tab.eq(index).addClass '_active'

  }
}