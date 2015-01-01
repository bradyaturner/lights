require 'lights/bulbstate'
require 'lights/hobject'

class Bulb < HObject
  attr_reader :id, :name, :type, :swversion, :state
  def initialize(id,data = {})
    super(data)
    @id = id
    @name = data["name"]
    @type = data["type"]
    @swversion = data["swversion"]
    @state = BulbState.new data["state"]
  end

  def data
    data = @data
    data["name"] = @name if @name
    data["type"] = @type if @type
    data["swversion"] = @swversion if @swversion
    data["state"] = @state.data if !@state.data.empty?
    data
  end
end

