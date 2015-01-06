require 'lights/hobject'

class Scene < HObject
  attr_accessor :id, :name, :active, :lights
  def initialize(id,data = {})
    @id = id
    keys = %W{ name active lights }
    keys.each {|key| instance_variable_set("@#{key}",data[key])}
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["active"] = @active if @active 
    data["lights"] = @lights if @lights
    data
  end
end

