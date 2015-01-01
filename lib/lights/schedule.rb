require 'lights/command'
require 'lights/hobject'

class Schedule < HObject
  attr_reader :id, :name, :time, :status
  def initialize(id,data = {})
    super(data)
    @id = id
    @name = data["name"]
    @time = data["time"]
    @status = data["status"]
    @command = Command.new(data["command"])
  end

  def scene
    @command.body["scene"]
  end

  def data
    data = @data
    data["name"] = @name if @name
    data["time"] = @time if @time
    data["status"] = @status if @status
    data["command"] = @command.data if !@command.data.empty?
    data
  end
end

