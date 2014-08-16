ruby-hue
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

CLI Usage
----
```
lights config --user <username> --ip <bridge ip>
lights list
```

Development
-----
Building:
```
gem build rubyhue.gemspec
```

Install development gem:
```
gem install rubyhue-0.0.3.gem
```
