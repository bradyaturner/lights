require 'lights/hobject'

class Group < HObject
  attr_reader :id, :name, :lights, :action, :type
  attr_writer :name, :lights, :action
  def initialize( id = nil, data = {} )
    @id = id
    @action = BulbState.new(data["action"]) 
    keys = %w{ name type lights }
    keys.each {|key| instance_variable_set("@#{key}",data[key])}
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["lights"] = @lights if @lights
    data["type"] = @type if @type
    data["action"] = @action.data if @action.data != {}
    data
  end
end
