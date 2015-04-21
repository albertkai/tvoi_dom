Router.configure {
  layoutTemplate: 'mainLayout'
  loadingTemplate: 'loading'
  notFoundTemplate: '404'
}
Router.onBeforeAction ->
  $('#listModal').modal('hide')

Router.onBeforeAction (pause)->
  if !@ready()
    @render 'loading'
    pause()

Router.onAfterAction ->
  $(window).scrollTop(0)



Router.map ->

  @route 'index', {
    path: '/'
    template: 'search'
  }

  @route 'company', {
    path: '/:alias'
    layoutTemplate: 'company'
    template: '_mainPage'
    waitOn: ->
      Meteor.subscribe 'companies'
    data: ->
      company = Companies.findOne {'alias': @params.alias}

  }

  @route 'advantages', {
    path: 'info/advantages'
    tamplate: 'advantages'
  }

  @route 'tenant', {
    path: 'info/tenant'
    template: 'tenant'
  }

  @route 'table', {

    path: 'company/table'
    layoutTemplate: 'company'
    template: '_table'
    waitOn: ->
      Meteor.subscribe 'companies'
    data: ->
      company = Companies.findOne {'alias': @params.alias}

  }

