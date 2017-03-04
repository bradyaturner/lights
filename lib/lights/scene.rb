require 'lights/hobject'

class Scene < HObject
  attr_accessor :id, :name, :active, :lights, :recycle
  def initialize(id = nil,data = {})
    @id = id
    @name = data["name"]
    @active = data["active"]
    @lights = data["lights"]
    @recycle = data["recycle"]
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["active"] = @active unless @active.nil?
    data["lights"] = @lights if @lights
    data["recycle"] = @recycle if @recycle
    data
  end
end

