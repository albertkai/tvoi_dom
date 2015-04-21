Template._mainPage.helpers {

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