require 'lights/sensor'

class SensorList

  attr_reader :sensors

  def initialize(data = {})
    @sensors = []
    data.each{|id,value| @sensors << Sensor.new(id,value)} if data
    @data = data
  end

  def data
    data = @data
    @sensors.each {|s| data[s.id] = s.data} if @sensors
    data
  end
  
  def to_json(options={})
    data.to_json
  end
end

