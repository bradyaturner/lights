class SensorState
  attr_reader :data, :last_updated
  def initialize(data)
    @data = data
    @last_updated = data["lastupdated"]
  end

  def data
    data = @data
    data["lastupdated"] = @last_updated if @last_updated
    data
  end

  def to_json(options={})
    data.to_json
  end
end

class TapState < SensorState
  attr_reader :button_event
  def initialize(data)
    @button_event = data["button_event"]
    super
  end

  def data
    data = @data
    data["button_event"] = @button_event if @button_event
    data
  end

  def to_json(options={})
    data.to_json
  end
end

class Sensor 
  attr_reader :id, :data, :name, :type, :model_id, :manufacturer_name, :unique_id, :sw_version, :state
  def initialize( id, data = {} )
    @id = id
    @data = data
    @name = data["name"]
    @type = data["type"]
    @model_id = data["modelid"]
    @manufacturer_name = data["manufacturername"]
    @unique_id = data["uniqueid"]
    @sw_version = data["swversion"]
    @state = SensorState.new(data["state"])
    #@config = SensorConfig.new(data["config"])
  end
  
  def data
    data = @data
    data["name"] = @name if @name
    data["type"] = @type if @type
    data["modelid"] = @model_id if @model_id
    data["manufacturername"] = @manufacturer_name if @manufacturer_name
    data["uniqueid"] = @unique_id if @unique_id
    data["swversion"] = @sw_version if @sw_version
    data["state"] = @state.data if @state.data if !@state.data.empty?
    data
  end

  def to_json(options={})
    data.to_json
  end
end
