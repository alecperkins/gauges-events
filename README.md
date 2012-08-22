# [Gaug.es](http://get.gaug.es) Custom Events Tracker

## Usage
Add the `gauges_events.js` at the bottom of your page.<br>
It will automatically look for links with the `data-gauges-event` attribute:

```html
<a href="#play" data-gauges-event="[Index] Promo video: Play">Play</a>
<a href="#pause" data-gauges-event="[Index] Promo video: Pause">Pause</a>
```

That’s it\*! It really *is* that simple. It creates an iframe and tells it to navigate to `/gauges?event=EVENT` where `EVENT` is exactly the `data-gauges-event` attribute value. Said value can be anything, it is totally up to you to make your own pattern.

![Gauges dashboard](https://s3.amazonaws.com/gauges-events/dashboard.png)

### Custom triggering
```html
<script type="text/javascript">
  GaugesEvents.trackEvent('Ads|Apple|Click')
  GaugesEvents.trackEvent('[Contact page] vcard download')
  GaugesEvents.trackEvent('Contact: Submit form')
</script>
```

\* Okay, you do need some — very very basic — server setup.

## Server settings example (Sinatra)
```rb
get '/gauges' do
  %(
    <title>#{params[:event]}</title>
    <script type="text/javascript">
      var _gauges = _gauges || [];
      (function() {
        var t   = document.createElement('script');
        t.type  = 'text/javascript';
        t.async = true;
        t.id    = 'gauges-tracker';
        t.setAttribute('data-site-id', 'YOUR-GAUGES-ID');
        t.src = '//secure.gaug.es/track.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(t, s);
      })();
    </script>
  )
end
```
