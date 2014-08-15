Gem::Specification.new do |s|
  s.name        = 'rubyhue'
  s.version     = '0.0.3'
  s.date        = '2013-08-04'
  s.summary     = "rubyhue"
  s.description = "Client library for controlling Phillips Hue lights."
  s.authors     = ["Brady Turner"]
  s.email       = 'bradyaturner@gmail.com'
  s.files       = ["lib/rubyhue.rb",
                    "lib/rubyhue/huebulb.rb",
                    "lib/rubyhue/huegroup.rb"]
  s.homepage    =
    'http://rubygems.org/gems/rubyhue'
  s.license       = 'BAT'
  s.executables = ["lights"]
end
