lights
========
A Ruby library & CLI for interacting with Philips Hue.

* Philips Hue API Documentation: http://www.developers.meethue.com/philips-hue-api
* lights on RubyGems: https://rubygems.org/gems/lights

Installation
----
```
gem install lights 
```

Basic Usage
-----
```ruby
require 'lights'
client = Lights.new( '192.168.x.x', 'username' )
client.register_username
client.request_bulb_list
```
See [lights-examples](https://github.com/turnerba/lights-examples) for more usage examples.

CLI Quick Setup
----

```
lights discover -s
lights config -f --user <username>
lights register
lights list
lights on
lights off
```

See [Sample Usage (Implemented)](https://github.com/turnerba/lights/wiki/Sample-Usage-(Implemented)) for more usage examples.

Development
-----
#### Test:
```
bundle exec rspec spec/
bundle exec cucumber spec/features/
```
or
```
rake test
```

#### Build:
```
rake build
```

#### Install:
```
rake install
```
