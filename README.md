rubyhue
========
A Ruby library & CLI for controlling Phillips Hue lightbulbs.

Phillips Hue API Documentation: http://developers.meethue.com/index.html

Installation
----
```
gem install rubyhue
```

Basic Usage
-----
```ruby
require 'rubyhue'
client = Hue.new( '192.168.x.x', 'username' )
client.register_username
client.request_bulb_list
```

CLI Quick Setup
----

```
hue discover -s
hue config -f --user username
hue register
hue list
hue on -l all
hue off -l all
```

See [Sample Usage (Implemented)](https://github.com/turnerba/rubyhue/wiki/Sample-Usage-(Implemented)) for more usage examples.

Development
-----
Building:
```
gem build rubyhue.gemspec
```

Install development gem:
```
gem install rubyhue-0.0.4.gem
```
