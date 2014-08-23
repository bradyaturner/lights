require 'rubyhue/huebulbstate'

class HueBulb

  attr_reader :id, :name, :type, :swversion,
              :state

  def initialize(id,data = {})
    @id = id
    @name = data["name"]
    @type = data["type"]
    @swversion = data["type"]
    @state = HueBulbState.new data["state"]
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["type"] = @type if @type
    data["swversion"] = @swversion if @swversion
    data["state"] = @state.data if !@state.data.empty?
    data
  end
end

