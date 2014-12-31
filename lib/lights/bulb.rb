require 'lights/bulbstate'

class Bulb

  attr_reader :id, :name, :type, :swversion,
              :state

  def initialize(id,data = {})
    @id = id
    @name = data["name"]
    @type = data["type"]
    @swversion = data["swversion"]
    @state = BulbState.new data["state"]
    @data = data
  end

  def data
    data = @data
    data["name"] = @name if @name
    data["type"] = @type if @type
    data["swversion"] = @swversion if @swversion
    data["state"] = @state.data if !@state.data.empty?
    data
  end

  def to_json(options={})
    data.to_json
  end
end

