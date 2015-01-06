require 'lights/bulbstate'
require 'lights/hobject'

class Bulb < HObject
  KEYS = %W{name type swversion pointsymbol modelid uniqueid}
  attr_reader :id, :name, :type, :swversion, :state,
                :pointsymbol, :modelid, :uniqueid
  attr_writer :name, :state
  def initialize(id,data = {})
    @id = id
    KEYS.each {|key| instance_variable_set("@#{key}",data[key])}
    @state = BulbState.new data["state"]
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

