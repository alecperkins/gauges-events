class _GaugesEvents

  constructor: ->
    _GaugesEvents.iframe = this.createIframe()
    this.initTrackEvents()

  createIframe: ->
    iframe = document.createElement 'iframe'
    iframe.id = 'gauges-events-tracker'

    document.body.appendChild iframe
    iframe

  initTrackEvents: ->
    links = []
    domLinks = document.querySelectorAll '[data-gauges-event]'

    # Convert NodeList into Array
    for link in domLinks
      links.push link

    # Use Array::forEach method for its closure
    links.forEach (link) =>
      data = link.getAttribute 'data-gauges-event'
      link.addEventListener 'click', (e) =>
        _GaugesEvents.trackEvent data

  @trackEvent: (event) ->
    _GaugesEvents.iframe.src = "/gauges?event=#{event}"


# Singleton
window.GaugesEvents = new _GaugesEvents
