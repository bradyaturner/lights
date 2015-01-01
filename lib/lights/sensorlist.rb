require 'lights/sensor'
require 'lights/list'

class SensorList < List
  def initialize(data = {})
    super
    data.each{|id,value| @list << Sensor.new(id,value)} if data
  end
end

