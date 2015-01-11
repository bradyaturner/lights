class SensorState < HObject
  attr_reader :last_updated
  def initialize(data)
    @last_updated = data["lastupdated"]
    @daylight = data["daylight"]
    @button_event = data["buttonevent"]
  end

  def data
    data = {}
    data["lastupdated"] = @last_updated if @last_updated
    data["daylight"] = @daylight unless @daylight.nil?
    data["buttonevent"] = @button_event if @button_event
    data
  end
end

class Sensor < HObject
  attr_reader :id, :data, :name, :type, :model_id,
                :manufacturer_name, :unique_id,
                :sw_version, :state
  def initialize( id, data = {} )
    @id = id
    @name = data["name"]
    @type = data["type"]
    @model_id = data["modelid"]
    @manufacturer_name = data["manufacturername"]
    @unique_id = data["uniqueid"]
    @sw_version = data["swversion"]
    @config = data["config"]
    @state = SensorState.new(data["state"])
  end
  
  def data
    data = {}
    data["name"] = @name if @name
    data["type"] = @type if @type
    data["modelid"] = @model_id if @model_id
    data["manufacturername"] = @manufacturer_name if @manufacturer_name
    data["uniqueid"] = @unique_id if @unique_id
    data["swversion"] = @sw_version if @sw_version
    data["config"] = @config if @config
    data["state"] = @state.data unless @state.data.empty?
    data
  end
end
