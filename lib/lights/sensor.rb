class SensorState < HObject
  KEYS = %W{ lastupdated daylight buttonevent }
  attr_reader :lastupdated, :daylight, :buttonevent
  def initialize(data)
    KEYS.each {|key| instance_variable_set("@#{key}",data[key])}
  end

  def data
    data = {}
    KEYS.each do |k|
      v = instance_variable_get("@#{k}")
      data[k] = v unless v.nil?
    end
    data
  end
end

class Sensor < HObject
  KEYS = %W{ config name type modelid manufacturername uniqueid swversion }
  attr_reader :id, :name, :type, :modelid, :manufacturername,
                :uniqueid, :swversion, :state
  def initialize( id, data = {} )
    @id = id
    KEYS.each {|key| instance_variable_set("@#{key}",data[key])}
    @state = SensorState.new(data["state"])
  end
  
  def data
    data = {}
    data["state"] = @state.data unless @state.data.empty?
    KEYS.each do |k|
      v = instance_variable_get("@#{k}")
      data[k] = v unless v.nil?
    end
    data
  end
end
