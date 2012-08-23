class _GaugesEvents

  constructor: ->
    _GaugesEvents.iframe = this.createIframe()
    this.initTrackEvents()

  createIframe: ->
    iframe = document.createElement 'iframe'
    iframe.id = 'gauges-events-tracker'
    iframe.style.cssText = 'width:0;height:0;border:0'

    document.body.appendChild iframe
    iframe

  initTrackEvents: ->
    links = if document.querySelector
        document.querySelectorAll '[data-gauges-event]'
      else
        (elem for elem in document.getElementsByTagName('*') when elem.hasAttribute('data-gauges-event'))

    [eventMethod, eventName] = if window.addEventListener
        ['addEventListener', 'click']
      else
        ['attachEvent', 'onclick']

    for link in links
      do (link) ->
        data = link.getAttribute 'data-gauges-event'
        link[eventMethod] eventName, (e) ->
          _GaugesEvents.trackEvent data

  @trackEvent: (event) ->
    _GaugesEvents.iframe.src = "/gauges?event=#{event}"


# Singleton
window.GaugesEvents = new _GaugesEvents
