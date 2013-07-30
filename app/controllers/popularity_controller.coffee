Quips   = require 'quips'
getJSON = require('jqueryify').getJSON

PopularityChartsView  = require 'views/popularity/charts'
PopularityFormView    = require 'views/popularity/form'


class PopularityController extends Quips.Controller
  layout: require 'templates/popularity/layout'

  views:
    '#album_form':  'formView'
    '.charts':      'chartsView'

  events:
    'formView.submit':        'addCharts'
    'formView.clear':         'clear'

  constructor: ->
    @formView = new PopularityFormView().render()
    @chartsView = new PopularityChartsView().render()
    super

  addCharts: (album, showPie) ->
    url = "#{Quips.host}/#{album}"
    getJSON(url).done (result) =>
      @chartsView.add(result, showPie)

  clear: -> @chartsView.clear()


module.exports = PopularityController
