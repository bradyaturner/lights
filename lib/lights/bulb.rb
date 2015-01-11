require 'lights/bulbstate'
require 'lights/hobject'

class Bulb < HObject
  attr_reader :id, :name, :type, :sw_version, :state,
                :point_symbol, :model_id, :unique_id
  attr_writer :name, :state
  def initialize(id,data = {})
    @id = id
    @name = data["name"]
    @type = data["type"]
    @sw_version = data["swversion"]
    @point_symbol = data["pointsymbol"]
    @model_id = data["modelid"]
    @unique_id = data["uniqueid"]
    @state = BulbState.new data["state"]
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["type"] = @type if @type
    data["swversion"] = @sw_version if @sw_version
    data["state"] = @state.data unless @state.data.empty?
    data["pointsymbol"] = @point_symbol if @point_symbol
    data["modelid"] = @model_id if @model_id
    data["uniqueid"] = @unique_id if @unique_id
    data
  end
end

