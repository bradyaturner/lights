require 'lights/command'
require 'lights/hobject'

class Schedule < HObject
  KEYS = %W{name time status description localtime created}
  attr_reader :id, :name, :time, :status,
                :description, :localtime, :created
  def initialize(id,data = {})
    @id = id
    KEYS.each {|key| instance_variable_set("@#{key}",data[key])}
    @command = Command.new(data["command"])
  end

  def scene
    @command.body["scene"]
  end

  def data
    data = {}
    data["command"] = @command.data if !@command.data.empty?
    KEYS.each do |k|
      v = instance_variable_get("@#{k}")
      data[k] = v unless v.nil?
    end
    data
  end
end

