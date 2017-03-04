require 'lights/hobject'

class Scene < HObject
  attr_accessor :id, :name, :active, :lights, :recycle, :transition_time
  def initialize(id = nil,data = {})
    @id = id
    @name = data["name"]
    @active = data["active"]
    @lights = data["lights"]
    @recycle = data["recycle"]
    @transition_time = data["transitiontime"]
  end

  def data
    data = {}
    data["name"] = @name if @name
    data["active"] = @active unless @active.nil?
    data["lights"] = @lights if @lights
    data["recycle"] = @recycle if @recycle
    data["transitiontime"] = @transition_time if @transition_time
    data
  end
end

