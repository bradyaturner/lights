Gem::Specification.new do |s|
  s.name        = 'rubyhue'
  s.version     = '0.0.4'
  s.date        = '2014-08-17'
  s.summary     = "rubyhue"
  s.description = "Client library and CLI for controlling Phillips Hue lights."
  s.authors     = ["Brady Turner"]
  s.email       = 'bradyaturner@gmail.com'
  s.files       = ["lib/rubyhue.rb",
                    "lib/rubyhue/huebulb.rb",
                    "lib/rubyhue/huebridge.rb",
                    "lib/rubyhue/huegroup.rb",
                    "lib/rubyhue/hueexception.rb"]
  s.homepage    =
    'http://rubygems.org/gems/rubyhue'
  s.license       = 'BAT'
  s.executables = ["hue"]
end
