class SensorState < HObject
  attr_reader :lastupdated, :daylight, :buttonevent
  def initialize(data)
    super
    keys = %W{ lastupdated daylight buttonevent }
    keys.each {|key| instance_variable_set("@#{key}",data[key])}
  end

  def data
    data = {}
    data["lastupdated"] = @lastupdated if @lastupdated
    data["buttonevent"] = @buttonevent if @buttonevent
    data["daylight"] = @daylight unless @daylight.nil?
    data
  end
end

class Sensor < HObject
  attr_reader :id, :data, :name, :type, :modelid, :manufacturername, :uniqueid, :swversion, :state
  def initialize( id, data = {} )
    super
    @id = id
    keys = %W{ config name type modelid manufacturername uniqueid swversion }
    keys.each {|key| instance_variable_set("@#{key}",data[key])}
    @state = SensorState.new(data["state"])
  end
  
  def data
    data = {}
    data["name"] = @name if @name
    data["type"] = @type if @type
    data["modelid"] = @modelid if @modelid
    data["manufacturername"] = @manufacturername if @manufacturername
    data["uniqueid"] = @uniqueid if @uniqueid
    data["swversion"] = @swversion if @swversion
    data["state"] = @state.data unless @state.data.empty?
    data["config"] = @config if @config
    data
  end
end
