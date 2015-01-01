require 'lights/hobject'

class Group < HObject
  attr_reader :id, :data, :name, :lights, :action
  attr_writer :name, :lights, :action
  def initialize( id = nil, data = {} )
    super(data)
    @id = id
    @action = BulbState.new(data["action"]) 
    @name = data["name"]
    @lights = data["lights"]
  end

  def data
    data = @data
    data["name"] = @name if @name
    data["lights"] = @lights if @lights
    data["action"] = @action.data if @action.data != {}
    data
  end
end
