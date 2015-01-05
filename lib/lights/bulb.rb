require 'lights/bulbstate'
require 'lights/hobject'

class Bulb < HObject
  attr_reader :id, :name, :type, :swversion, :state
  attr_writer :name
  def initialize(id,data = {})
    super
    @id = id
    keys = %W{name type swversion pointsymbol modelid uniqueid}
    keys.each {|key| instance_variable_set("@#{key}",data[key])}
    @state = BulbState.new data["state"]
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["type"] = @type if @type
    data["swversion"] = @swversion if @swversion
    data["state"] = @state.data if !@state.data.empty?
    data["pointsymbol"] = @pointsymbol if @pointsymbol
    data["modelid"] = @modelid if @modelid
    data["uniqueid"] = @uniqueid if @uniqueid
    data
  end
end

