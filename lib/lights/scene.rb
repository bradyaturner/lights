require 'lights/hobject'

class Scene < HObject
  attr_accessor :id, :name, :active, :lights
  def initialize(id,data = {})
    @id = id
    @name = data["name"]
    @active = data["active"]
    @lights = data["lights"]
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["active"] = @active unless @active.nil?
    data["lights"] = @lights if @lights
    data
  end
end

