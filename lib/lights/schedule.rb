require 'lights/command'
require 'lights/hobject'

class Schedule < HObject
  attr_reader :id, :name, :time, :status,
                :description, :localtime, :created
  def initialize(id,data = {})
    @id = id
    keys = %W{name time status description localtime created}
    keys.each {|key| instance_variable_set("@#{key}",data[key])}
    @command = Command.new(data["command"])
  end

  def scene
    @command.body["scene"]
  end

  def data
    data = {}
    data["command"] = @command.data if !@command.data.empty?
    data["name"] = @name if @name
    data["time"] = @time if @time
    data["status"] = @status if @status
    data["description"] = @description if @description
    data["localtime"] = @localtime if @localtime
    data["created"] = @created if @created
    data
  end
end

