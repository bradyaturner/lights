require 'lights/hobject'

class Group < HObject
  attr_reader :id, :data, :name, :lights, :action, :type
  attr_writer :name, :lights, :action
  def initialize( id = nil, data = {} )
    @id = id
    @action = BulbState.new(data["action"]) 
    @name = data["name"]
    @lights = data["lights"]
    @type = data["type"]
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["lights"] = @lights if @lights
    data["type"] = @type if @type
    data["action"] = @action.data unless @action.data.empty?
    data
  end
end
