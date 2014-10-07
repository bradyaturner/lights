class HueSensorState
  attr_reader :data, :last_updated
  def initialize(data)
    @data = data
    @last_updated = data["lastupdated"]
  end
end

class HueTapState < HueSensorState
  attr_reader :button_event
  def initialize(data)
    @button_event = data["button_event"]
    super
  end
end

class HueSensor 
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
    @state = HueSensorState.new(data["state"])
    #@config = HueSensorConfig.new(data["config"])
  end
end
