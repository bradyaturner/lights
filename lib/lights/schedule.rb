require 'lights/command'

class Schedule
  attr_reader :id, :name, :time, :status
  def initialize(id,data = {})
    @id = id
    @name = data["name"]
    @time = data["time"]
    @status = data["status"]
    @command = Command.new(data["command"])
    @data = data
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

  def to_json(options={})
    data.to_json
  end
end

