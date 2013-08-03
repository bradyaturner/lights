ruby-hue
========
Installation
```
gem install rubyhue
```

Basic Usage
```ruby
require 'rubyhue'
client = Hue.new( '192.168.x.x', 'username' )
client.register_username
client.request_bulb_list
```
