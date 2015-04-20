Template.index.rendered = ->

  IndexCtrl.tabs.init()
  GoogleMaps.init {}, ->
    mapOptions = {
      zoom:15,
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
    map = new google.maps.Map(document.getElementById("map"), mapOptions)
    map.setCenter(new google.maps.LatLng( 59.876428, 30.446602 ))
    markerPos = new google.maps.LatLng(59.876428,30.446602)
    marker = new google.maps.Marker({
      position: markerPos,
      map: map,
      title:"Тсж №135"
    })



#@initializeMap = ->
#
#  mapOptions = {
#    lat:59.9386505,
#    lng:30.3730258,
#    zoom:13,
#    zoomControl:true,
#    zoomControlOpt:{
#      style:"MEDIUM",
#      position:"RIGHT_BOTTOM"
#    },
#    panControl:true,
#    streetViewControl:false,
#    mapTypeControl:false,
#    overviewMapControl:false,
#    scrollwheel:false
#  }
#
#  @map  = new google.maps.Map(document.getElementById('map'), mapOptions)
#  google.maps.event.addListener map, 'tilesloaded', ->
#    console.log("Tiles loaded")


Template.index.events {

  'click #tab-nav li': (e)->

    index = $(e.currentTarget).index()
    $('#tab-nav li').removeClass '_active'
    $(e.currentTarget).addClass '_active'
    IndexCtrl.tabs.goTo(index)

}


@IndexCtrl = {

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