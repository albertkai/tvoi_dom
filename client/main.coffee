Meteor.subscribe 'companies'


Template.mainLayout.rendered = ->

  MainCtrl['loader'] = new CanvasLoader('main-loader')
  MainCtrl['loader'].setColor('#ffffff')
  MainCtrl['loader'].setDiameter(56)
  MainCtrl['loader'].setDensity(66)
  MainCtrl['loader'].setRange(1)
  MainCtrl['loader'].setFPS(51)


Template.listCompanies.helpers {
  companies: ->
    Companies.find()

}

Template.mainLayout.events {
  'click #toggleList': ->
    $('#listModal').modal('show')
}