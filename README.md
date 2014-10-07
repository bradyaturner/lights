rue
========
A Ruby library & CLI for controlling Phillips Hue lightbulbs.

Phillips Hue API Documentation: http://developers.meethue.com/index.html

Installation
----
```
gem install rue 
```

Basic Usage
-----
```ruby
require 'rue'
client = Rue.new( '192.168.x.x', 'username' )
client.register_username
client.request_bulb_list
```

CLI Quick Setup
----

```
rue discover -s
rue config -f --user username
rue register
rue list
rue on -l all
rue off -l all
```

See [Sample Usage (Implemented)](https://github.com/turnerba/rue/wiki/Sample-Usage-(Implemented)) for more usage examples.

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
