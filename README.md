## Usage
Add the `gaugesevents.min.js` at the bottom of your page.<br>
It will automatically look for links with the `data-gauges-event` attribute:

```html
<a href="#play" data-gauges-event="[Index] Promo video: Play">Play</a>
<a href="#pause" data-gauges-event="[Index] Promo video: Pause">Pause</a>
```

### ☝ Teh mighty result ☟
![Gauges dashboard](https://s3.amazonaws.com/gauges-events/dashboard.png)

### Custom triggering
```html
<script type="text/javascript">
  GaugesEvents.trackEvent('Ads|Apple|Click')
  GaugesEvents.trackEvent('[Contact page] vcard download')
  GaugesEvents.trackEvent('Contact: Submit form')
</script>
```

That’s it!\*<br>
It really *is* that simple. It creates an iframe and tells it to navigate to `/gauges?event=EVENT` where `EVENT` is exactly the `data-gauges-event` attribute value. Said value can be anything, it is totally up to you to make your own pattern.<br><br>
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
Don’t forget to edit `YOUR-GAUGES-ID`

## Compiling & Minifying
[Yes, the source is in CoffeeScript](http://vimeo.com/35258313)

### Development
If you have no clue how to manually compile CoffeeScript, I’d suggest a tool like [CodeKit](http://incident57.com/codekit/) or [LiveReload](http://livereload.com).<br>
Personally (when in a non-sprockets friendly environment) I simply use [this handy TextMate command](https://gist.github.com/1993872).<br>

### Production version
```sh
$ bundle install
$ rake compile
```

## Mucho thanks
[@rafBM](https://github.com/rafBM) - ([#1](https://github.com/EtienneLem/gauges-events/pull/1), [#2](https://github.com/EtienneLem/gauges-events/pull/2))
